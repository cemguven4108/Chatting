import 'package:chatting_app/configuration/firebase_configuration.dart';
import 'package:chatting_app/models/message_model.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.receiverId,
  }) : super(key: key);

  final String receiverId;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    Future<void> _sendText(BuildContext context) async {
      if (controller.text.isNotEmpty) {
        final message = MessageModel(
          content: controller.text,
          sentTime: DateTime.now(),
          senderId: firebaseAuth.currentUser!.uid,
          receiverId: receiverId,
        );

        await firebaseFirestore
            .collection("users")
            .doc(firebaseAuth.currentUser!.uid)
            .collection("chat")
            .doc(receiverId)
            .collection("messages")
            .add(
              //message.toJson(),
              {}
            );

        await firebaseFirestore
            .collection('users')
            .doc(receiverId)
            .collection('chat')
            .doc(firebaseAuth.currentUser!.uid)
            .collection('messages')
            .add(//message.toJson()
            {}
            );
      }
    }

    return Row(
      children: <Widget>[
        Expanded(
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: "Add Message...",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Colors.deepPurple),
              ),
            ),
          ),
        ),
        const SizedBox(width: 5),
        CircleAvatar(
          backgroundColor: Colors.deepPurple,
          radius: 20,
          child: IconButton(
            onPressed: () => _sendText(context),
            icon: const Icon(
              Icons.send,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
