import 'package:chatting_app/utils/theme/custom_theme.dart';
import 'package:flutter/material.dart';

class IosTheme extends CustomTheme {

  IosTheme({
    required super.textTheme,
  });

  factory IosTheme.light() {
    return IosTheme(
      textTheme: customTextTheme(IosColors.bigTextColorLight),
    );
  }

  factory IosTheme.dark() {
    return IosTheme(
      textTheme: customTextTheme(IosColors.bigTextColorDark),
    );
  }
}

class IosColors {
  static const bigTextColorLight = Colors.white;
  static const bigTextColorDark = Colors.black;
}

TextTheme customTextTheme(Color color) {
  return TextTheme(
    titleLarge: TextStyle(
      color: color,
      fontSize: 25,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold,
    ),
  );
}
