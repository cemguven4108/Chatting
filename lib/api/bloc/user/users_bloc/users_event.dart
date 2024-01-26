abstract class UsersEvent {
  const UsersEvent();
}

class UsersEventInitialize implements UsersEvent {}

class UsersEventOpenStream implements UsersEvent {}

class UsersEventCloseStream implements UsersEvent {}