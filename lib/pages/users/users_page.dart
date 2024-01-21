import 'package:chatting_app/configuration/firebase_configuration.dart';
import 'package:chatting_app/models/user_model.dart';
import 'package:chatting_app/pages/users/user_item.dart';
import 'package:flutter/material.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              await firebaseFirestore
                  .collection("users")
                  .doc(firebaseAuth.currentUser!.uid)
                  .update({
                "isOnline": false,
                "lastActive": DateTime.now(),
              });
              firebaseAuth.signOut();
            },
            icon: const Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: firebaseFirestore.collection("users").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final users = snapshot.requireData.docs
                .map((doc) => UserModel.fromJson(doc.data()))
                .where((element) => element.id != firebaseAuth.currentUser!.uid)
                .toList();

            return ListView.separated(
              itemCount: users.length,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return UserItem(user: users[index]);
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
