import 'package:chatting_app/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class MessageCard extends StatelessWidget {
  const MessageCard({
    Key? key,
    required this.isOwner,
    required this.message,
  }) : super(key: key);

  final bool isOwner;
  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isOwner ? Alignment.topLeft : Alignment.topRight,
      child: Container(
        decoration: BoxDecoration(
          color: isOwner ? Colors.deepPurple : Colors.grey,
          borderRadius: isOwner
              ? const BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                )
              : const BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
        ),
        margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment:
              isOwner ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              message.content,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 5),
              Text(
                timeago.format(message.sentTime),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
