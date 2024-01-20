import 'package:chatting_app/utils/theme/theme_generator.dart';
import 'package:flutter/material.dart';

class AuthFormButton extends StatelessWidget {
  const AuthFormButton({
    Key? key,
    required this.label,
    this.onPressed,
  }) : super(key: key);

  final String label;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return MaterialButton(
      onPressed: onPressed,
      color: Colors.white70,
      shape: const StadiumBorder(),
      minWidth: size.width * 0.3,
      child: Text(
        label,
        style: ThemeGenerator.of(context).textTheme!.labelLarge,
      ),
    );
  }
}
