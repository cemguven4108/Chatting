import 'package:chatting_app/utils/theme/android_theme.dart';
import 'package:chatting_app/utils/theme/custom_theme.dart';
import 'package:flutter/material.dart';

class WebTheme extends CustomTheme {
  WebTheme({
    required super.textTheme,
  });

  factory WebTheme.theme() {
    return WebTheme(
      textTheme: customTextTheme(),
    );
  }
}

TextTheme customTextTheme() {
  return AndroidTheme.light().textTheme!;
}