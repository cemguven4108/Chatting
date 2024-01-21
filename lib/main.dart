import 'package:chatting_app/bloc/auth/auth_bloc.dart';
import 'package:chatting_app/bloc/auth/auth_state.dart';
import 'package:chatting_app/configuration/firebase_configuration.dart';
import 'package:chatting_app/firebase_options.dart';
import 'package:chatting_app/pages/home/home_page.dart';
import 'package:chatting_app/pages/login/login_page.dart';
import 'package:chatting_app/repository/auth_repository.dart';
import 'package:chatting_app/repository/storage_repository.dart';
import 'package:chatting_app/repository/user_repository.dart';
import 'package:chatting_app/service/auth_service.dart';
import 'package:chatting_app/service/storage_service.dart';
import 'package:chatting_app/service/user_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FlutterError.onError = (details) {};

  runApp(
    MultiBlocProvider(
      providers: providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthLoggedIn) return const HomePage();
            return const LoginPage();
          },
        ),
      ),
    ),
  );
}

final providers = [
  BlocProvider(
    create: (context) => AuthBloc(
      AuthService(
        AuthRepository(firebaseAuth),
        UserService(
          UserRepository(usersCollection),
        ),
        StorageService(
          StorageRepository(firebaseStorage),
        ),
      ),
    ),
  ),
];
