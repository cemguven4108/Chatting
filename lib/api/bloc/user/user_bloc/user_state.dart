import 'package:chatting_app/models/user_model.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class UserState {
  const UserState();
}

class UserStateInitialize extends UserState {
  const UserStateInitialize();
}

class UserStateLoaded extends UserState {
  final UserModel user;

  const UserStateLoaded(this.user);
}
