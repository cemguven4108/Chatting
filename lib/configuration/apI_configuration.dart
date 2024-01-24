import 'package:chatting_app/api/bloc/auth/auth_bloc.dart';
import 'package:chatting_app/api/bloc/auth/auth_event.dart';
import 'package:chatting_app/api/bloc/user/user_bloc/user_bloc.dart';
import 'package:chatting_app/api/bloc/user/users_bloc/users_bloc.dart';
import 'package:chatting_app/api/repository/auth_repository.dart';
import 'package:chatting_app/api/repository/storage_repository.dart';
import 'package:chatting_app/api/repository/user_repository.dart';
import 'package:chatting_app/api/service/auth_service.dart';
import 'package:chatting_app/api/service/storage_service.dart';
import 'package:chatting_app/api/service/user_service.dart';
import 'package:chatting_app/constants/collection_names.dart';
import 'package:chatting_app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final _firebaseAuth = FirebaseAuth.instance;
final _firebaseStorage = FirebaseStorage.instance;

final _usersCollection = FirebaseFirestore.instance
    .collection(Collections.USERS)
    .withConverter<UserModel>(
      fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
      toFirestore: (model, options) => model.toJson(),
    );

// ignore: unused_element
final _messagesCollection =
    FirebaseFirestore.instance.collection(Collections.MESSAGES);

// AuthBloc Instances
final _authBlocInstance = AuthBloc(_authServiceInstance);
final _authServiceInstance = AuthService(
  _authRepositoryInstance,
  _userServiceInstance,
  _storageServiceInstance,
);
final _authRepositoryInstance = AuthRepository(_firebaseAuth);

// UserBloc & UsersBloc Instances
final _usersBlocInstance = UsersBloc(_userServiceInstance);
final _userBlocInstance = UserBloc(_userServiceInstance);
final _userServiceInstance = UserService(_userRepositoryInstance);
final _userRepositoryInstance = UserRepository(_usersCollection);

// StorageInstances
final _storageServiceInstance = StorageService(_storageRepositoryInstance);
final _storageRepositoryInstance = StorageRepository(_firebaseStorage);

// BlocProviders
final userBlocProvider = BlocProvider(create: (context) => _userBlocInstance);
final usersBlocProvider = BlocProvider(create: (context) => _usersBlocInstance);
final authBlocProvider = BlocProvider(create: (context) => _authBlocInstance..add(AuthEventInitialize()));