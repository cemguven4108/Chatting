import 'package:chatting_app/api/bloc/user/user_bloc/user_bloc.dart';
import 'package:chatting_app/api/bloc/user/users_bloc/users_bloc.dart';
import 'package:chatting_app/api/repository/user_repository.dart';
import 'package:chatting_app/firebase_options.dart';
import 'package:chatting_app/pages/auth/login/login_page.dart';
import 'package:chatting_app/pages/users/users_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBloc(
            userRepository: UserRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => UsersBloc(
            userRepository: UserRepository(),
          ),
        ),
      ],
      child: MaterialApp(
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
    ),
  );
}
