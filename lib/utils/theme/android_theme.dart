import 'package:chatting_app/utils/theme/custom_theme.dart';
import 'package:flutter/material.dart';

class AndroidTheme extends CustomTheme {
  AndroidTheme({
    super.textTheme,
    super.inputDecorationTheme,
  });

  factory AndroidTheme.light() {
    return AndroidTheme(
      textTheme: customTextTheme(
        mainColor: Colors.white,
        secondaryColor: Colors.deepPurple.shade900,
      ),
      inputDecorationTheme: inputDecorationTheme(
        mainColor: Colors.white,
        errorColor: Colors.red,
      ),
    );
  }

  factory AndroidTheme.dark() {
    return AndroidTheme(
      textTheme: customTextTheme(
        mainColor: Colors.black,
        secondaryColor: Colors.deepPurple.shade900,
      ),
      inputDecorationTheme: inputDecorationTheme(
        mainColor: Colors.black,
        errorColor: Colors.red,
      ),
    );
  }
}

TextTheme customTextTheme({
  required Color mainColor,
  required Color secondaryColor,
}) {
  return TextTheme(
      titleLarge: TextStyle(
        color: mainColor,
        fontSize: 25,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: mainColor,
        fontSize: 17,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        color: secondaryColor,
        fontSize: 14,
        fontStyle: FontStyle.italic,
      ),
      labelMedium: TextStyle(
        color: secondaryColor,
        fontSize: 13,
        fontStyle: FontStyle.italic,
      ));
}

InputDecoration inputDecorationTheme({
  required Color mainColor,
  required Color errorColor,
}) {
  return InputDecoration(
    border: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
      borderSide: BorderSide(
        color: mainColor,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
      borderSide: BorderSide(
        color: mainColor,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
      borderSide: BorderSide(
        color: errorColor,
      ),
    ),
    prefixIconColor: mainColor,
    suffixIconColor: mainColor,
  );
}
