import 'package:bloc/bloc.dart';
import 'package:chatting_app/bloc/auth/auth_event.dart';
import 'package:chatting_app/bloc/auth/auth_state.dart';
import 'package:chatting_app/service/auth_service.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService;

  AuthBloc({required this.authService}) : super(AuthInitial()) {
    on(_onLogin);
    on(_onRegister);
  }

  void _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoggingIn());

    final result = await authService.login(event.email, event.password);

    if (result == null) {
      emit(AuthError());
      return;
    }
    emit(AuthSuccess());
  }

  void _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthRegistering());

    final result = await authService.register(
      event.email,
      event.password,
      event.fullName,
      event.imageUrl,
    );

    if (result == null) {
      emit(AuthError());
      return;
    }
    emit(AuthSuccess());
  }
}
