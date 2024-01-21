import 'package:chatting_app/pages/login/login_form_field.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            buildTitle(),
            buildFormFields(),
            buildFormButton(),
          ],
        ),
      ),
    );
  }

  Widget buildTitle() {
    return const Text(
      "Chatting",
      style: TextStyle(
        color: Colors.deepPurple,
        fontWeight: FontWeight.bold,
        fontSize: 25,
        fontStyle: FontStyle.italic,
      ),
    );
  }

  Widget buildFormFields() {
    return const Column(
      children: <Widget>[
        LoginFormField(
          hintText: "Email",
        ),
        LoginFormField(
          hintText: "Password",
          isPassword: true,
        ),
      ],
    );
  }

  Widget buildFormButton() {
    return ElevatedButton(
      onPressed: () {
        final result = _formKey.currentState!.validate();
        if (result) {
          _formKey.currentState!.save();
        }
      },
      child: const Text("Login"),
    );
  }
}
