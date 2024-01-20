import 'package:bloc/bloc.dart';
import 'package:chatting_app/api/bloc/user/user_bloc/user_event.dart';
import 'package:chatting_app/api/bloc/user/user_bloc/user_state.dart';
import 'package:chatting_app/api/repository/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserInitial()) {
    on<AddUser>(_onAdd);
    on<UpdateUser>(_onUpdate);
    on<DeleteUser>(_onDelete);
    on<GetUser>(_onGet);
  }

  void _onAdd(AddUser event, Emitter<UserState> emit) async {
    emit(UserLoading());

    await userRepository.addUser(
      event.userModel,
    );

    emit(UserSuccess());
  }

  void _onUpdate(UpdateUser event, Emitter<UserState> emit) async {
    emit(UserLoading());

    await userRepository.updateUser(
      event.userModel,
    );

    emit(UserSuccess());
  }

  void _onDelete(DeleteUser event, Emitter<UserState> emit) async {
    emit(UserLoading());

    await userRepository.deleteUser(
      event.id,
    );

    emit(UserSuccess());
  }

  void _onGet(GetUser event, Emitter<UserState> emit) async {
    emit(UserLoading());

    final userModel = await userRepository.getUser(
      event.id,
    );

    if (userModel != null) {
      emit(UserLoaded(userModel: userModel));
    } else {
      emit(UserError());
    }
  }
}
