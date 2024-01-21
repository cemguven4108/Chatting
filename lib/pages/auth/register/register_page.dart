import 'package:chatting_app/pages/auth/auth_background.dart';
import 'package:chatting_app/pages/auth/auth_form_button.dart';
import 'package:chatting_app/pages/auth/auth_form_field.dart';
import 'package:chatting_app/pages/auth/auth_form_container.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late GlobalKey<FormState> formKey;

  String fullNameText = "";
  String emailText = "";
  String passwordText = "";
  String passwordRepeatText = "";

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          const AuthBackground(),
          AuthFormContainer(
            radius: 0.7,
            child: Form(
              key: formKey,
              child: ListWheelScrollView(
                itemExtent: 60,
                children: [
                  AuthFormField(
                    label: "Full Name",
                    icon: Icons.person_outline,
                    validator: (value) => validateFields(value),
                    onSaved: (name) => fullNameText = save(name),
                  ),
                  AuthFormField(
                    label: "Email",
                    icon: Icons.email_outlined,
                    isEmail: true,
                    validator: (value) => validateFields(value),
                    onSaved: (name) => emailText = save(name),
                  ),
                  AuthFormField(
                    label: "Password",
                    icon: Icons.key_outlined,
                    isPassword: true,
                    validator: (value) => validatePassword(
                      value,
                      passwordRepeatText,
                    ),
                    onChanged: (value) => passwordText = value,
                  ),
                  AuthFormField(
                    label: "Password Repeat",
                    icon: Icons.key_outlined,
                    isPassword: true,
                    validator: (value) => validatePassword(
                      value,
                      passwordText,
                    ),
                    onChanged: (value) => passwordRepeatText = value,
                  ),
                  AuthFormButton(
                    label: "Register",
                    onPressed: () {
                      final isValid = formKey.currentState!.validate();
                      formKey.currentState!.save();
                      if (isValid) {
                        register();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void register() async {
  }

  String save(String? value) {
    if (value != null && value.isNotEmpty) {
      return value;
    }
    return "";
  }

  String? validateFields(String? value) {
    if (value == null || value.isEmpty) {
      return "";
    }
    return null;
  }

  String? validatePassword(String? value, String repeatValue) {
    if (validateFields(value) != null) {
      return "";
    }
    if (value != repeatValue) {
      return "Passwords must be the same";
    }
    return null;
  }
}
