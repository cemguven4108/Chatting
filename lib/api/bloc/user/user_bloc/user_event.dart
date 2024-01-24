import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class UserEvent {
  const UserEvent();
}

@immutable
class UserEventUpdate implements UserEvent {
  final String id;
  final Map<String, dynamic> data;

  const UserEventUpdate({
    required this.id,
    required this.data,
  });
}
