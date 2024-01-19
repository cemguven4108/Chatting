import 'package:flutter/material.dart';

class AuthFormButton extends StatelessWidget {
  const AuthFormButton({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          label,
          style: TextStyle(
            color: Colors.deepPurple.shade900,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}
