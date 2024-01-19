import 'package:flutter/material.dart';

class LoginFormContainer extends StatelessWidget {
  const LoginFormContainer({
    Key? key,
    this.child,
  }) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: RadialGradient(
          tileMode: TileMode.repeated,
          colors: [
            Colors.deepPurple.shade700,
            Colors.white30,
          ],
        ),
      ),
      child: child,
    );
  }
}
