import 'dart:io';

import 'package:chatting_app/models/user_model.dart';
import 'package:chatting_app/widgets/message_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

final firebaseAuthInstance = FirebaseAuth.instance;
final firebaseStorageInstance = FirebaseStorage.instance;
final firebaseFireStore = FirebaseFirestore.instance;
final firebaseCloudMessaging = FirebaseMessaging.instance;

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key, required this.user}) : super(key: key);

  final UserModel user;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  File? _selectedImage;
  final controller = TextEditingController();
  List<String> messageList = [];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  void _uploadImage() async {
    if (_selectedImage != null) {
      User? loggedInUser = firebaseAuthInstance.currentUser;

      final storageRef = firebaseStorageInstance
          .ref()
          .child("images")
          .child("${loggedInUser!.uid}.jpg");

      await storageRef.putFile(_selectedImage!);

      final url = await storageRef.getDownloadURL();

      await firebaseFireStore
          .collection("users")
          .doc(loggedInUser.uid)
          .update({'image': url});
    }
  }

  Future<String> _getUserImage() async {
    User? loggedInUser = firebaseAuthInstance.currentUser;
    final document =
        firebaseFireStore.collection("users").doc(loggedInUser!.uid);
    final documentSnapshot = await document.get();

    final imageUrl = await documentSnapshot.get("image");
    return imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(
                widget.user.image!,
              ),
              radius: 20,
            ),
            const SizedBox(width: 10),
            Column(
              children: [
                Text(
                  widget.user.name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.user.isOnline ? 'Online' : 'Offline',
                  style: TextStyle(
                    color: widget.user.isOnline ? Colors.green : Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: <Widget>[
                Expanded(
                  child: MessageField(
                    controller: controller,
                    hintText: "Add Message...",
                  ),
                ),
                const SizedBox(width: 5),
                CircleAvatar(
                  backgroundColor: Colors.deepPurple,
                  radius: 20,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                CircleAvatar(
                  backgroundColor: Colors.deepPurple,
                  radius: 20,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
