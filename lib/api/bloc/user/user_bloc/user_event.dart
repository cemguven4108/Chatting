
import 'package:chatting_app/models/user_model.dart';

abstract class UserEvent {}

class AddUser extends UserEvent {
  final UserModel userModel;

  AddUser({
    required this.userModel,
  });
}

class UpdateUser extends UserEvent {
  final UserModel userModel;

  UpdateUser({
    required this.userModel,
  });
}

class DeleteUser extends UserEvent {
  final String id;

  DeleteUser({
    required this.id,
  });
}

class GetUser extends UserEvent {
  final String id;

  GetUser({
    required this.id,
  });
}