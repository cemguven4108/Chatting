import 'package:chatting_app/constants/auth/auth_widget_constants.dart';
import 'package:chatting_app/utils/theme/theme_generator.dart';
import 'package:flutter/material.dart';

class AuthFormField extends StatefulWidget {
  const AuthFormField({
    Key? key,
    required this.label,
    required this.icon,
    this.isPassword,
    this.isEmail,
    this.controller,
    this.validator,
    this.onSaved,
    this.onChanged,
  }) : super(key: key);

  final String label;
  final IconData icon;
  final bool? isPassword;
  final bool? isEmail;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;
  final void Function(String? value)? onSaved;
  final void Function(String value)? onChanged;

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
    return Container(
      margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
      child: TextFormField(
        controller: widget.controller,
        obscureText: isVisible,
        validator: widget.validator,
        onSaved: widget.onSaved,
        onChanged: widget.onChanged,
        keyboardType: buildEmailKeyboard(),
        decoration: InputDecoration(
          border: ThemeGenerator.of(context).inputDecorationTheme!.border,
          enabledBorder:
              ThemeGenerator.of(context).inputDecorationTheme!.enabledBorder,
          errorBorder:
              ThemeGenerator.of(context).inputDecorationTheme!.errorBorder,
          prefixIconColor:
              ThemeGenerator.of(context).inputDecorationTheme!.prefixIconColor,
          suffixIconColor:
              ThemeGenerator.of(context).inputDecorationTheme!.suffixIconColor,
          labelStyle: ThemeGenerator.of(context).textTheme!.bodyLarge,
          label: Text(widget.label),
          prefixIcon: Icon(widget.icon),
          suffixIcon: buildPasswordField(),
        ),
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
          isVisible ? formFieldPasswordVisible : formFieldPasswordNotVisible,
        ),
      );
    }
    return null;
  }
}
