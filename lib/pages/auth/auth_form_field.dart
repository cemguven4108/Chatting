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
    return Flexible(
      child: TextFormField(
        obscureText: isVisible,
        validator: widget.validator,
        onSaved: widget.onSaved,
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
          labelStyle: ThemeGenerator.of(context).textTheme!.labelMedium,
          prefixIcon: Icon(
            widget.icon,
          ),
          label: Text(widget.label),
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
