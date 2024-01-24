import 'package:chatting_app/api/bloc/user/user_bloc/user_event.dart';
import 'package:chatting_app/api/bloc/user/user_bloc/user_state.dart';
import 'package:chatting_app/api/service/user_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserService _userService;

  UserBloc(this._userService) : super(const UserStateInitialize()) {
    on<UserEventUpdate>((event, emit) => _onUpdate(event, emit));
  }

  void _onUpdate(
      UserEventUpdate event, Emitter<UserState> emit) async {}
}
