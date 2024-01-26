import 'package:chatting_app/api/bloc/user/users_bloc/users_event.dart';
import 'package:chatting_app/api/bloc/user/users_bloc/users_state.dart';
import 'package:chatting_app/api/service/auth_service.dart';
import 'package:chatting_app/api/service/user_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UserService _userService;
  final AuthService _authService;

  UsersBloc(
    this._userService,
    this._authService,
  ) : super(const UsersStateInitialize()) {
    on<UsersEventOpenStream>((event, emit) => _watchStream(event, emit));
  }

  void _watchStream(
      UsersEventOpenStream event, Emitter<UsersState> emit) async {
    emit(const UsersStateOpenedStream(users: [], isLoading: true));

    final usersStream = await _userService.getStream();
    final user = await _authService.getUser();

    await emit.forEach(usersStream, onData: (users) {
      if (user != null) {
        return UsersStateOpenedStream(
          users: users.where((element) => element.id != user.uid).toList(),
        );
      }
      return UsersStateOpenedStream(users: users);
    });
  }
}
