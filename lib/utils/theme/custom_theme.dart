import 'package:flutter/material.dart';

abstract class CustomTheme {
  final TextTheme? textTheme;
  final ButtonStyle? elevatedButtonStyle;
  final InputDecoration? inputDecorationTheme;
  
  const CustomTheme({
    this.textTheme,
    this.elevatedButtonStyle,
    this.inputDecorationTheme
  });
}
