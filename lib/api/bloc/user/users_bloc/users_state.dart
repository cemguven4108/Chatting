
import 'package:chatting_app/models/user_model.dart';

abstract class UsersState {}

class UsersInitial extends UsersState {}

class UsersLoading extends UsersState {}

class UsersLoaded extends UsersState {
  final Stream<List<UserModel>> userModels;

  UsersLoaded({
    required this.userModels,
  });
}

class UsersError extends UsersState {}

class UsersSuccess extends UsersState {}