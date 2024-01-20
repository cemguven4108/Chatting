import 'package:bloc/bloc.dart';
import 'package:chatting_app/api/bloc/user/users_bloc/users_event.dart';
import 'package:chatting_app/api/bloc/user/users_bloc/users_state.dart';
import 'package:chatting_app/api/repository/user_repository.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UserRepository userRepository;

  UsersBloc({
    required this.userRepository,
  }) : super(UsersInitial()) {
    on<GetAllUsers>(_onGetAll);
  }

  void _onGetAll(
      GetAllUsers event, Emitter<UsersState> emit) async {
    emit(UsersLoading());

    final userModels = await userRepository.getAllUsers();

    emit(UsersLoaded(userModels: userModels));
  }
}