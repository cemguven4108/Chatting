import 'package:chatting_app/pages/chat_page.dart';
import 'package:chatting_app/providers/firebase_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class UsersPage extends StatefulWidget {
  const UsersPage({
    Key? key,
  }) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  void initState() {
    Provider.of<FirebaseProvider>(context, listen: false).getAllUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chats"),
        actions: [
          IconButton(
            onPressed: () async {
              await firebaseFireStore
                  .collection("users")
                  .doc(firebaseAuthInstance.currentUser!.uid)
                  .update(
                {"isOnline": false},
              );
              firebaseAuthInstance.signOut();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Consumer<FirebaseProvider>(
        builder: (context, value, child) {
          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            separatorBuilder: (context, index) {
              return const SizedBox(height: 10);
            },
            itemCount: value.users.length,
            itemBuilder: (context, index) {
              final user = value.users[index];

              return user.id != firebaseAuthInstance.currentUser?.uid
                  ? GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => ChatScreen(user: user),
                          ),
                        );
                      },
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Stack(
                          alignment: Alignment.bottomRight,
                          children: <Widget>[
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(user.image!),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: CircleAvatar(
                                backgroundColor:
                                    user.isOnline ? Colors.green : Colors.grey,
                                radius: 5,
                              ),
                            ),
                          ],
                        ),
                        title: Text(
                          user.name,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          "Last Active: ${timeago.format(user.lastActive.toDate())}",
                          maxLines: 2,
                          style: const TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 15,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox();
            },
          );
        },
      ),
    );
  }
}
