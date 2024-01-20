import 'package:chatting_app/models/user_model.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final UserModel userModel;

  UserLoaded({
    required this.userModel,
  });
}

class UserError extends UserState {}

class UserSuccess extends UserState {}