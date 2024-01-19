import 'package:flutter/material.dart';

abstract class CustomTheme {
  final TextTheme? textTheme;
  final ButtonTheme? buttonTheme;
  final InputDecoration? inputDecorationTheme;
  
  const CustomTheme({
    this.textTheme,
    this.buttonTheme,
    this.inputDecorationTheme
  });
}
