import 'package:chatting_app/bloc/auth/auth_bloc.dart';
import 'package:chatting_app/bloc/auth/auth_event.dart';
import 'package:chatting_app/pages/login/login_form_field.dart';
import 'package:chatting_app/pages/register/register_page.dart';
import 'package:chatting_app/utils/theme/theme_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildFormFields(),
          buildFormButton(),
        ],
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
      textAlign: TextAlign.center,
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
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 20),
          alignment: Alignment.bottomRight,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const RegisterPage(),
                ),
              );
            },
            child: Text(
              "Register?",
              style: ThemeGenerator.of(context).textTheme!.bodyMedium,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            final result = _formKey.currentState!.validate();
            if (result) {
              _formKey.currentState!.save();
              context.read<AuthBloc>().add(LoginEvent(
                  email: "cemguven4108@hotmail.com", password: "cemguven4108"));
            }
          },
          child: const Text("Login"),
        ),
      ],
    );
  }
}
