import 'package:chatting_app/api/bloc/auth/auth_bloc.dart';
import 'package:chatting_app/api/bloc/auth/auth_event.dart';
import 'package:chatting_app/api/bloc/message/message_bloc.dart';
import 'package:chatting_app/api/bloc/user/user_bloc/user_bloc.dart';
import 'package:chatting_app/api/bloc/user/users_bloc/users_bloc.dart';
import 'package:chatting_app/api/repository/auth_repository.dart';
import 'package:chatting_app/api/repository/message_repository.dart';
import 'package:chatting_app/api/repository/storage_repository.dart';
import 'package:chatting_app/api/repository/user_repository.dart';
import 'package:chatting_app/api/service/auth_service.dart';
import 'package:chatting_app/api/service/message_service.dart';
import 'package:chatting_app/api/service/storage_service.dart';
import 'package:chatting_app/api/service/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final _firebaseAuth = FirebaseAuth.instance;
final _firebaseStorage = FirebaseStorage.instance;

// AuthBloc Instances
final _authBlocInstance = AuthBloc(_authServiceInstance);
final _authServiceInstance = AuthService(
  _authRepositoryInstance,
  _userServiceInstance,
  _storageServiceInstance,
);
final _authRepositoryInstance = AuthRepository(_firebaseAuth);

// UserBloc & UsersBloc Instances
final _usersBlocInstance =
    UsersBloc(_userServiceInstance, _authServiceInstance);
final _userBlocInstance = UserBloc(_userServiceInstance);
final _userServiceInstance = UserService(_userRepositoryInstance);
final _userRepositoryInstance = UserRepository();

// MessageBloc
final _messageBlocInstance =
    MessageBloc(_messageServiceInstance, _authServiceInstance);
final _messageServiceInstance = MessageService(_messageRepositoryInstance);
final _messageRepositoryInstance = MessageRepository();

// StorageInstances
final _storageServiceInstance = StorageService(_storageRepositoryInstance);
final _storageRepositoryInstance = StorageRepository(_firebaseStorage);

// BlocProviders
final userBlocProvider = BlocProvider(create: (context) => _userBlocInstance);
final usersBlocProvider = BlocProvider(create: (context) => _usersBlocInstance);
final messageBlocProvider =
    BlocProvider(create: (context) => _messageBlocInstance);
final authBlocProvider = BlocProvider(
    create: (context) => _authBlocInstance..add(AuthEventInitialize()));
