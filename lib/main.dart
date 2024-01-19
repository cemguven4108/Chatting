import 'package:chatting_app/firebase_options.dart';
import 'package:chatting_app/pages/auth/login/login_page.dart';
import 'package:chatting_app/pages/users_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const UsersPage();
          }
          return const LoginPage();
        },
      ),
    ),
  );
}
