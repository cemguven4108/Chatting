import 'package:chatting_app/models/user_model.dart';
import 'package:chatting_app/pages/chat/chat_page.dart';
import 'package:flutter/material.dart';

class UserItem extends StatefulWidget {
  const UserItem({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UserModel user;

  @override
  State<UserItem> createState() => _UserItemState();
}

class _UserItemState extends State<UserItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ChatPage(
              userId: widget.user.id,
            ),
          ),
        );
      },
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: widget.user.imageUrl != null
                  ? NetworkImage(widget.user.imageUrl!)
                  : null,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: CircleAvatar(
                backgroundColor:
                    widget.user.isOnline ? Colors.green : Colors.grey,
                radius: 5,
              ),
            ),
          ],
        ),
        title: Text(
          widget.user.fullName,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
