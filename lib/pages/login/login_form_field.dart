import 'package:chatting_app/utils/theme/theme_generator.dart';
import 'package:flutter/material.dart';

class LoginFormField extends StatelessWidget {
  const LoginFormField({
    Key? key,
    required this.hintText,
    this.isPassword = false,
  }) : super(key: key);

  final String hintText;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.height * 0.4,
      margin: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "";
          }
          if (!isPassword && !value.contains("@")) {
            return "Wrong Email Format";
          }
          if (isPassword && value.length < 8) {
            return "Password Must Be More Than 8 Characters Long";
          }
          return null;
        },
        keyboardType: !isPassword
            ? TextInputType.emailAddress
            : TextInputType.visiblePassword,
        obscureText: isPassword,
        decoration: InputDecoration(
          border: ThemeGenerator.of(context).inputDecorationTheme!.border,
          enabledBorder: ThemeGenerator.of(context).inputDecorationTheme!.enabledBorder,
          focusedBorder: ThemeGenerator.of(context).inputDecorationTheme!.focusedBorder,
          errorBorder: ThemeGenerator.of(context).inputDecorationTheme!.errorBorder,
          prefixIcon: Icon(
            isPassword ? Icons.key_outlined : Icons.email_outlined,
          ),
          prefixIconColor: ThemeGenerator.of(context).inputDecorationTheme!.prefixIconColor,
          hintText: hintText,
          hintStyle: ThemeGenerator.of(context).textTheme!.bodySmall,
        ),
      ),
    );
  }
}