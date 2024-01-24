import 'package:bloc/bloc.dart';
import 'package:chatting_app/api/bloc/auth/auth_event.dart';
import 'package:chatting_app/api/bloc/auth/auth_state.dart';
import 'package:chatting_app/api/service/auth_service.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;

  AuthBloc(this._authService) : super(AuthStateLoggedOut()) {
    on(_onLogin);
    on(_onRegister);
    on(_onLogout);
    on(_onInitialize);
  }

  void _onInitialize(AuthEventInitialize event, Emitter<AuthState> emit) async {
    final user = _authService.getUser();
    if (user == null) {
      emit(AuthStateLoggedOut());
    } else {
      emit(AuthStateLoggedIn());
    }
  }

  void _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthStateLoggedIn(isLoading: true));

    final result = await _authService.login(event.email, event.password);

    if (result == null) {
      emit(AuthStateError());
      return;
    }
    emit(AuthStateLoggedIn());
  }

  void _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthRegistered(isLoading: true));

    final result = await _authService.register(
      event.email,
      event.password,
      event.fullName,
      event.file,
    );

    if (result == null) {
      emit(AuthStateError());
      return;
    }
    emit(AuthStateSuccess());
  }

  void _onLogout(LogoutEvent event, Emitter<AuthState> emit) async {
    emit(AuthStateLoggedOut(isLoading: true));

    if (!_authService.logout()) {
      emit(AuthStateError());
      return;
    }
    emit(AuthStateLoggedOut());
  }
}
