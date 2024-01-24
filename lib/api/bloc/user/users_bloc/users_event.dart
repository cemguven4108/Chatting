import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class UsersEvent {
  const UsersEvent();
}

class UsersEventWatchStream implements UsersEvent {}

class UsersEventCloseStream implements UsersEvent {}