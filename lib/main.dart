import 'package:chatting_app/api/bloc/auth/auth_bloc.dart';
import 'package:chatting_app/api/bloc/auth/auth_state.dart';
import 'package:chatting_app/configuration/apI_configuration.dart';
import 'package:chatting_app/firebase_options.dart';
import 'package:chatting_app/loading/loading_page.dart';
import 'package:chatting_app/pages/home/home_page.dart';
import 'package:chatting_app/pages/login/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FlutterError.onError = (details) {};

  runApp(
    MultiBlocProvider(
      providers: [
        userBlocProvider,
        usersBlocProvider,
        authBlocProvider,
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.isLoading) {
              LoadingPage.instance().show(
                context: context,
                text: "Loading...",
              );
            } else {
              LoadingPage.instance().hide();
            }
          },
          builder: (context, state) {
            if (state is AuthStateLoggedOut) {
              return const LoginPage();
            } else if (state is AuthStateLoggedIn) {
              return const HomePage();
            }
            return Container();
          },
        ),
      ),
    ),
  );
}