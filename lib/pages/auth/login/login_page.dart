import 'package:chatting_app/constants/auth/login/login_text_constants.dart';
import 'package:chatting_app/constants/auth/login/login_widget_constants.dart';
import 'package:chatting_app/pages/auth/auth_form_button.dart';
import 'package:chatting_app/pages/auth/auth_form_field.dart';
import 'package:chatting_app/pages/auth/auth_background.dart';
import 'package:chatting_app/pages/auth/auth_form_container.dart';
import 'package:chatting_app/pages/auth/recovery/recovery_page.dart';
import 'package:chatting_app/pages/auth/register/register_page.dart';
import 'package:chatting_app/utils/theme/theme_generator.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: AuthBackground(
        child: Center(
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: AuthFormContainer(
              child: Form(
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
        const Flexible(
          child: AuthFormField(
            label: formFieldEmail,
            icon: formFieldIconEmail,
          ),
        ),
        const Flexible(
          child: AuthFormField(
            label: formFieldPassword,
            icon: formFieldIconPassword,
            isPassword: true,
          ),
        ),
        buildNavigationButtons(context),
        const Spacer(),
        const Flexible(
          child: AuthFormButton(
            label: buttonTitle,
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
}
