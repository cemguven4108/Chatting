import 'package:flutter/material.dart';

class AuthFormField extends StatefulWidget {
  const AuthFormField({
    Key? key,
    required this.label,
    required this.icon,
    this.isPassword,
    this.isEmail,
    this.validator,
    this.onSaved,
  }) : super(key: key);

  final String label;
  final IconData icon;
  final bool? isPassword;
  final bool? isEmail;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  @override
  State<AuthFormField> createState() => _AuthFormFieldState();
}

class _AuthFormFieldState extends State<AuthFormField> {
  late bool isVisible;

  @override
  void initState() {
    super.initState();
    isVisible = widget.isPassword ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isVisible,
      validator: widget.validator,
      onSaved: widget.onSaved,
      keyboardType: buildEmailKeyboard(),
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(
            color: Colors.white70,
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(
            color: Colors.white70,
          ),
        ),
        icon: Icon(
          widget.icon,
          color: Colors.white70,
        ),
        label: Text(
          widget.label,
          style: const TextStyle(color: Colors.white70),
        ),
        suffixIcon: buildPasswordField(),
      ),
    );
  }

  TextInputType? buildEmailKeyboard() {
    if (widget.isEmail != null && widget.isEmail!) {
      return TextInputType.emailAddress;
    }
    return null;
  }

  Widget? buildPasswordField() {
    if (widget.isPassword != null && widget.isPassword!) {
      return IconButton(
        onPressed: () {
          setState(() {
            isVisible = !isVisible;
          });
        },
        icon: Icon(
          isVisible
              ? Icons.remove_red_eye_outlined
              : Icons.visibility_off_outlined,
          color: Colors.white70,
        ),
      );
    }
    return null;
  }
}