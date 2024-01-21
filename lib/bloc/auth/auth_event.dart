abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent({
    required this.email,
    required this.password,
  });
}

class Logout extends AuthEvent {}

class RegisterEvent extends AuthEvent {
  final String email;
  final String password;
  final String fullName;
  final String imageUrl;

  RegisterEvent({
    required this.email,
    required this.password,
    required this.fullName,
    required this.imageUrl,
  });
}
