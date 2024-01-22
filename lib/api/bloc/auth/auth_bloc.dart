import 'package:bloc/bloc.dart';
import 'package:chatting_app/api/bloc/auth/auth_event.dart';
import 'package:chatting_app/api/bloc/auth/auth_state.dart';
import 'package:chatting_app/api/service/auth_service.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;

  AuthBloc(this._authService) : super(AuthInitial()) {
    on(_onLogin);
    on(_onRegister);
    on(_onLogout);
  }

  void _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoggingIn());

    final result = await _authService.login(event.email, event.password);

    if (result == null) {
      emit(AuthError());
      return;
    }
    emit(AuthLoggedIn());
  }

  void _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthRegistering());

    final result = await _authService.register(
      event.email,
      event.password,
      event.fullName,
      event.file,
    );

    if (result == null) {
      emit(AuthError());
      return;
    }
    emit(AuthSuccess());
  }

  void _onLogout(LogoutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoggingOut());

    if (!_authService.logout()) {
      emit(AuthError());
      return;
    }
    emit(AuthSuccess());
  }
}
