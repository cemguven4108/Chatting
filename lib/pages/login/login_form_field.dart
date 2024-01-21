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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.red.shade900,
            ),
          ),
          prefixIcon: Icon(
            isPassword ? Icons.key_outlined : Icons.email_outlined,
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}