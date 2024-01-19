import 'package:chatting_app/configuration/firebase_configuration.dart';
import 'package:flutter/material.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({
    Key? key,
  }) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              firebaseAuth.signOut();
            },
            icon: const Icon(Icons.exit_to_app_outlined),
          ),
        ],
      ),
    );
  }
}
