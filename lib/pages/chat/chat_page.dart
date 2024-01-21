import 'package:chatting_app/configuration/firebase_configuration.dart';
import 'package:chatting_app/models/message_model.dart';
import 'package:chatting_app/models/user_model.dart';
import 'package:chatting_app/pages/chat/custom_text_field.dart';
import 'package:chatting_app/pages/chat/message_card.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({
    Key? key,
    required this.userId,
  }) : super(key: key);

  final String userId;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  UserModel? user;
  //File? _selectedImage;

  @override
  void initState() {
    firebaseFirestore
        .collection("users")
        .doc(widget.userId)
        .snapshots(includeMetadataChanges: true)
        .listen((model) {
      setState(() {
        user = UserModel.fromJson(model.data()!);
      });
    });

    super.initState();
  }

  // void _pickImage() async {
  //   final image = await ImagePicker().pickImage(source: ImageSource.camera);
  //   if (image != null) {
  //     setState(() {
  //       _selectedImage = File(image.path);
  //     });
  //   }
  // }

  // void _uploadImage() async {
  //   if (_selectedImage != null) {
  //     User? loggedInUser = firebaseAuth.currentUser;

  //     final storageRef = firebaseStorage
  //         .ref()
  //         .child("images")
  //         .child("${loggedInUser!.uid}.jpg");

  //     await storageRef.putFile(_selectedImage!);

  //     final url = await storageRef.getDownloadURL();

  //     await firebaseFirestore
  //         .collection("users")
  //         .doc(loggedInUser.uid)
  //         .update({'imageUrl': url});
  //   }
  // }

  // Future<String> _getUserImage() async {
  //   User? loggedInUser = firebaseAuth.currentUser;
  //   final document =
  //       firebaseFirestore.collection("users").doc(loggedInUser!.uid);
  //   final documentSnapshot = await document.get();

  //   final imageUrl = await documentSnapshot.get("imageUrl");

  //   return imageUrl;
  // }

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return MessageCard(
                    isOwner: true,
                    message: MessageModel(
                      content: "adsads",
                      sentTime: DateTime.now(),
                      senderId: "adsad",
                      receiverId: "adsads",
                    ),
                  );
                },
              ),
            ),
            CustomTextField(
              receiverId: "",
            ),
          ],
        ),
      ),
    );
  }
}
