import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class UserState {
  const UserState();
}

class UserStateInitialize extends UserState {
  const UserStateInitialize();
}