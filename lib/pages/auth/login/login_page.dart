import 'package:chatting_app/configuration/firebase_configuration.dart';
import 'package:chatting_app/constants/auth/login/login_text_constants.dart';
import 'package:chatting_app/constants/auth/login/login_widget_constants.dart';
import 'package:chatting_app/pages/auth/auth_form_button.dart';
import 'package:chatting_app/pages/auth/auth_form_field.dart';
import 'package:chatting_app/pages/auth/auth_background.dart';
import 'package:chatting_app/pages/auth/auth_form_container.dart';
import 'package:chatting_app/pages/auth/recovery/recovery_page.dart';
import 'package:chatting_app/pages/auth/register/register_page.dart';
import 'package:chatting_app/utils/theme/theme_generator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late GlobalKey<FormState> formKey;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() {
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: Center(
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: AuthFormContainer(
              child: Form(
                key: formKey,
                child: buildFormChildren(context),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildFormChildren(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          formTitle,
          style: ThemeGenerator.of(context).textTheme!.titleLarge,
        ),
        const Spacer(),
        Flexible(
          child: AuthFormField(
            label: formFieldEmail,
            icon: formFieldIconEmail,
            onSaved: (value) => emailController.text = value!,
          ),
        ),
        Flexible(
          child: AuthFormField(
            label: formFieldPassword,
            icon: formFieldIconPassword,
            isPassword: true,
            onSaved: (value) => passwordController.text = value!,
          ),
        ),
        buildNavigationButtons(context),
        const Spacer(),
        Flexible(
          child: AuthFormButton(
            label: buttonTitle,
            onPressed: () {
              final isValid = formKey.currentState!.validate();

              if (isValid) {
                formKey.currentState!.save();
                _login();
              }
            },
          ),
        ),
      ],
    );
  }

  Widget buildNavigationButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const RecoveryPage(),
                ),
              );
            },
            child: Text(
              gestureForgotTitle,
              style: ThemeGenerator.of(context).textTheme!.labelMedium,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const RegisterPage(),
                ),
              );
            },
            child: Text(
              gestureRegisterTitle,
              style: ThemeGenerator.of(context).textTheme!.labelMedium,
            ),
          ),
        ],
      ),
    );
  }

  void _login() async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      await firebaseFirestore.collection("users").doc(firebaseAuth.currentUser!.uid).update({
        "isOnline": true,
        "lastActive": DateTime.now(),
      });
    } on FirebaseAuthException catch (exception) {
      //
    }
  }
}
