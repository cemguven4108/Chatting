import 'package:flutter/material.dart';

class AuthFormContainer extends StatelessWidget {
  const AuthFormContainer({
    Key? key,
    this.child,
    this.radius,
  }) : super(key: key);

  final double? radius;
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
          radius: radius ?? 0.5,
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
