import 'dart:io';

import 'package:chatting_app/configuration/firebase_configuration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  File? _selectedImage;

  @override
  void initState() {
    super.initState();
  }

  void _updateTokenInDb(String token) async {
    await firebaseFirestore
        .collection("users")
        .doc(firebaseAuth.currentUser!.uid)
        .update({'fcm': token});
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
      User? loggedInUser = firebaseAuth.currentUser;

      final storageRef = firebaseStorage
          .ref()
          .child("images")
          .child("${loggedInUser!.uid}.jpg");

      await storageRef.putFile(_selectedImage!);

      final url = await storageRef.getDownloadURL();

      await firebaseFirestore
          .collection("users")
          .doc(loggedInUser.uid)
          .update({'imageUrl': url});
    }
  }

  Future<String> _getUserImage() async {
    User? loggedInUser = firebaseAuth.currentUser;
    final document =
        firebaseFirestore.collection("users").doc(loggedInUser!.uid);
    final documentSnapshot = await document.get();

    final imageUrl = await documentSnapshot.get("imageUrl");

    return imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Firebase App"), actions: [
        IconButton(
            onPressed: () {
              firebaseAuth.signOut();
            },
            icon: const Icon(Icons.logout))
      ]),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(children: [
            const SizedBox(height: 30),
            if (_selectedImage == null)
              FutureBuilder(
                  future: _getUserImage(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      return CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 40,
                          foregroundImage: NetworkImage(snapshot.data!));
                    }
                    if (snapshot.hasError) {
                      return const Text("Avatar yüklenirken bir hata oluştu..");
                    }
                    return const CircularProgressIndicator();
                  }),
            if (_selectedImage != null)
              CircleAvatar(
                  radius: 40, foregroundImage: FileImage(_selectedImage!)),
            TextButton(
                onPressed: () {
                  _pickImage();
                },
                child: const Text("Resim Seç")),
            if (_selectedImage != null)
              ElevatedButton(
                  onPressed: () {
                    _uploadImage();
                  },
                  child: const Text("Yükle"))
          ]),
        ],
      ),
    );
  }
}
