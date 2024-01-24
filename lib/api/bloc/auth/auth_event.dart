import 'dart:io';

abstract class AuthEvent {}

class AuthEventInitialize extends AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent({
    required this.email,
    required this.password,
  });
}

class LogoutEvent extends AuthEvent {}

class RegisterEvent extends AuthEvent {
  final String email;
  final String password;
  final String fullName;
  final File file;

  RegisterEvent({
    required this.email,
    required this.password,
    required this.fullName,
    required this.file,
  });
}
