import 'package:chatting_app/pages/login/login_form.dart';
import 'package:chatting_app/utils/theme/theme_generator.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Chatting",
                style: ThemeGenerator.of(context).textTheme!.headlineLarge,
              ),
              SizedBox(
                height: size.height * 0.4,
                width: size.width * 0.9,
                child: const LoginForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
