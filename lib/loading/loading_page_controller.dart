import 'package:flutter/foundation.dart' show immutable;

typedef CloseLoadingPage = bool Function();
typedef UpdateLoadingPage = bool Function(String text);

@immutable
class LoadingPageController {
  final CloseLoadingPage close;
  final UpdateLoadingPage update;

  const LoadingPageController({
    required this.close,
    required this.update,
  });
}