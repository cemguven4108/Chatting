import 'package:flutter/material.dart';

abstract class CustomTheme {
  final TextTheme textTheme;
  
  const CustomTheme({
    required this.textTheme,
  });
}
