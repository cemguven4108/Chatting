import 'package:chatting_app/pages/auth/auth_background.dart';
import 'package:chatting_app/pages/auth/auth_form_button.dart';
import 'package:chatting_app/pages/auth/auth_form_field.dart';
import 'package:chatting_app/pages/auth/auth_form_container.dart';
import 'package:chatting_app/utils/theme/theme_generator.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final formKey = GlobalKey<FormState>();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          const AuthBackground(),
          AuthFormContainer(
            radius: 0.7,
            child: Form(
              child: ListWheelScrollView(
                itemExtent: 60,
                children: const [
                  AuthFormField(
                    label: "Full Name",
                    icon: Icons.person_outline,
                  ),
                  AuthFormField(
                    label: "Email",
                    icon: Icons.email_outlined,
                    isEmail: true,
                  ),
                  AuthFormField(
                    label: "Password",
                    icon: Icons.key_outlined,
                    isPassword: true,
                  ),
                  AuthFormField(
                    label: "Password Repeat",
                    icon: Icons.key_outlined,
                    isPassword: true,
                  ),
                  AuthFormButton(
                    label: "Register",
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.25,
            child: Text(
              "Register",
              style: ThemeGenerator.of(context).textTheme!.titleLarge,
            ),
          ),
        ],
      ),
    );
  }
}
