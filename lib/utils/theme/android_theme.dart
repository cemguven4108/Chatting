import 'package:chatting_app/utils/theme/custom_theme.dart';
import 'package:flutter/material.dart';

class AndroidTheme extends CustomTheme {
  AndroidTheme({
    required super.textTheme,
  });

  factory AndroidTheme.light() {
    return AndroidTheme(
      textTheme: customTextTheme(AndroidColors.bigTextColorLight),
    );
  }

  factory AndroidTheme.dark() {
    return AndroidTheme(
      textTheme: customTextTheme(AndroidColors.bigTextColorDark),
    );
  }
}

class AndroidColors {
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
