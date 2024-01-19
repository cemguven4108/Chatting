import 'package:flutter/material.dart';

class LoginBackground extends StatelessWidget {
  const LoginBackground({
    Key? key,
    this.child,
  }) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: SweepGradient(
          tileMode: TileMode.mirror,
          startAngle: 0.0,
          endAngle: 1.0,
          colors: [
            Colors.deepPurple,
            Colors.deepPurple.shade400,
          ],
        ),
      ),
      child: child,
    );
  }
}
