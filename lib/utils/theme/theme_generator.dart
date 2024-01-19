import 'dart:io';

import 'package:chatting_app/utils/theme/android_theme.dart';
import 'package:chatting_app/utils/theme/custom_theme.dart';
import 'package:chatting_app/utils/theme/ios_theme.dart';
import 'package:chatting_app/utils/theme/web_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeGenerator {
  const ThemeGenerator._();

  static CustomTheme of(BuildContext context) {
    if (kIsWeb) {
      return WebTheme.theme();
    }

    if (MediaQuery.of(context).platformBrightness == Brightness.light) {
      if (Platform.isAndroid || Platform.isWindows) {
        return AndroidTheme.light();
      } else {
        return IosTheme.light();
      }
    }

    if (Platform.isAndroid || Platform.isWindows) {
      return AndroidTheme.dark();
    }
    return IosTheme.dark();
  }
}
