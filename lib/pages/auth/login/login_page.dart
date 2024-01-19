import 'package:chatting_app/pages/auth/auth_form_button.dart';
import 'package:chatting_app/pages/auth/auth_form_field.dart';
import 'package:chatting_app/pages/auth/login/login_background.dart';
import 'package:chatting_app/pages/auth/login/login_form_container.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: LoginBackground(
        child: Center(
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: LoginFormContainer(
              child: Form(
                key: formKey,
                child: buildFormChildren(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildFormChildren() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          "Chatting",
          style: TextStyle(
            color: Colors.white70,
            fontSize: 25,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        AuthFormField(
          label: "Email",
          icon: Icons.email_outlined,
        ),
        SizedBox(height: 5),
        AuthFormField(
          label: "Password",
          icon: Icons.key_outlined,
          isPassword: true,
        ),
        Spacer(),
        AuthFormButton(
          label: "Login",
        ),
      ],
    );
  }
}
