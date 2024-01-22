
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoggingIn extends AuthState {}

class AuthLoggedIn extends AuthState {}

class AuthLoggingOut extends AuthState {}

class AuthRegistering extends AuthState {}

class AuthError extends AuthState {}

class AuthSuccess extends AuthState {}