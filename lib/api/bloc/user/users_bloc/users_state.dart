import 'package:chatting_app/models/user_model.dart';

abstract class UsersState {
  final bool isLoading;

  const UsersState({
    required this.isLoading,
  });
}

class UsersStateInitialize extends UsersState {
  const UsersStateInitialize({
    bool isLoading = false,
  }) : super(isLoading: isLoading);
}

class UsersStateOpenedStream extends UsersState {
  final List<UserModel> users;

  const UsersStateOpenedStream({
    required this.users,
    bool isLoading = false,
  }) : super(isLoading: isLoading);
}

class UsersStateClosedStream extends UsersState {
  const UsersStateClosedStream({
    bool isLoading = false,
  }) : super(isLoading: isLoading);
}

class UsersStateError extends UsersState {
  const UsersStateError({
    bool isLoading = false,
  }) : super(isLoading: isLoading);
}
