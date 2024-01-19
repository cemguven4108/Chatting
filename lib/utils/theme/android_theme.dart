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
        AndroidColors.bigTextLight,
      ),
      inputDecorationTheme: inputDecorationTheme(
        borderSideColor: AndroidColors.inputDecorationBorderSideLight,
        enabledBorderSideColor:
            AndroidColors.inputDecorationEnabledBorderSideLight,
        errorBorderSideColor: AndroidColors.inputDecorationErrorBorderSideLight,
        prefixIconColor: AndroidColors.inputDecorationPrefixIconLight,
        suffixIconColor: AndroidColors.inputDecorationSuffixIconLight,
        labelColor: AndroidColors.bigTextLight,
      ),
    );
  }

  factory AndroidTheme.dark() {
    return AndroidTheme(
      textTheme: customTextTheme(
        AndroidColors.bigTextDark,
      ),
      inputDecorationTheme: inputDecorationTheme(
        borderSideColor: AndroidColors.inputDecorationBorderSideDark,
        enabledBorderSideColor:
            AndroidColors.inputDecorationEnabledBorderSideDark,
        errorBorderSideColor: AndroidColors.inputDecorationErrorBorderSideDark,
        prefixIconColor: AndroidColors.inputDecorationPrefixIconDark,
        suffixIconColor: AndroidColors.inputDecorationSuffixIconDark,
        labelColor: AndroidColors.bigTextDark,
      ),
    );
  }
}

class AndroidColors {
  // Text - Light
  static const bigTextLight = Colors.white;

  // Text - Dark
  static const bigTextDark = Colors.black;

  // Input Decoration - Light
  static const inputDecorationBorderSideLight = Colors.white70;
  static const inputDecorationEnabledBorderSideLight = Colors.white70;
  static const inputDecorationErrorBorderSideLight = Colors.red;
  static const inputDecorationPrefixIconLight = Colors.white70;
  static const inputDecorationSuffixIconLight = Colors.white70;

  // Input Decoration - Dark
  static const inputDecorationBorderSideDark = Colors.black87;
  static const inputDecorationEnabledBorderSideDark = Colors.black87;
  static const inputDecorationErrorBorderSideDark = Colors.red;
  static const inputDecorationPrefixIconDark = Colors.black87;
  static const inputDecorationSuffixIconDark = Colors.black87;
}

TextTheme customTextTheme(Color color) {
  return TextTheme(
    titleLarge: TextStyle(
      color: color,
      fontSize: 25,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold,
    ),
    labelLarge: TextStyle(
      color: Colors.deepPurple.shade900,
      fontSize: 14,
      fontStyle: FontStyle.italic,
    ),
    labelMedium: TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontStyle: FontStyle.italic,
    )
  );
}

InputDecoration inputDecorationTheme({
  required Color borderSideColor,
  required Color enabledBorderSideColor,
  required Color errorBorderSideColor,
  required Color prefixIconColor,
  required Color suffixIconColor,
  required Color labelColor,
}) {
  return InputDecoration(
    border: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
      borderSide: BorderSide(
        color: borderSideColor,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
      borderSide: BorderSide(
        color: enabledBorderSideColor,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
      borderSide: BorderSide(
        color: errorBorderSideColor,
      ),
    ),
    prefixIconColor: prefixIconColor,
    suffixIconColor: suffixIconColor,
    labelStyle: customTextTheme(labelColor).labelMedium,
  );
}