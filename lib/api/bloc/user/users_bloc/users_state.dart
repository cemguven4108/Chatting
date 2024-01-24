import 'package:chatting_app/models/user_model.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class UsersState {
  const UsersState();
}

@immutable
class UsersStateInitialize extends UsersState {
  const UsersStateInitialize();
}

@immutable
class UsersStateWatchingStream extends UsersState {
  final List<UserModel> users;

  const UsersStateWatchingStream({
    required this.users,
  });
}

@immutable
class UsersStateError extends UsersState {
  const UsersStateError();
}
