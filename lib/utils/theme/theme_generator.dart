import 'dart:io';

import 'package:chatting_app/utils/theme/android_theme.dart';
import 'package:chatting_app/utils/theme/custom_theme.dart';
import 'package:chatting_app/utils/theme/ios_theme.dart';
import 'package:chatting_app/utils/theme/web_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeGenerator {
  final CustomTheme theme;

  const ThemeGenerator._({
    required this.theme,
  });

  factory ThemeGenerator.of(BuildContext context) {
    if (kIsWeb) {
      return ThemeGenerator._(
        theme: WebTheme.theme(),
      );
    }

    if (MediaQuery.of(context).platformBrightness == Brightness.light) {
      return ThemeGenerator._light();
    }
    return ThemeGenerator._dark();
  }

  factory ThemeGenerator._light() {
    if (Platform.isAndroid || Platform.isWindows) {
      return ThemeGenerator._(
        theme: AndroidTheme.light(),
      );
    }
    return ThemeGenerator._(
      theme: IosTheme.light(),
    );
  }

  factory ThemeGenerator._dark() {
    if (Platform.isAndroid || Platform.isWindows) {
      return ThemeGenerator._(
        theme: AndroidTheme.dark(),
      );
    }
    return ThemeGenerator._(
      theme: IosTheme.dark(),
    );
  }
}
