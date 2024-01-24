import 'dart:async';

import 'package:chatting_app/api/bloc/user/users_bloc/users_event.dart';
import 'package:chatting_app/api/bloc/user/users_bloc/users_state.dart';
import 'package:chatting_app/api/service/user_service.dart';
import 'package:chatting_app/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UserService _userService;

  UsersBloc(
    this._userService,
  ) : super(const UsersStateInitialize()) {
    on<UsersEventWatchStream>((event, emit) => _watchStream(event, emit));
    on<UsersEventCloseStream>((event, emit) => _stopStream(event, emit));
  }

  final _streamController = StreamController<List<UserModel>>();

  void _watchStream(UsersEventWatchStream event, Emitter<UsersState> emit) async {
    final userStream = await _userService.getStream();

    await _streamController.addStream(userStream);

    await userStream.forEach((users) {
      emit(UsersStateWatchingStream(users: users));
    });
  }

  void _stopStream(UsersEventCloseStream event, Emitter<UsersState> emit) async {
    await _streamController.close();
  }
}
