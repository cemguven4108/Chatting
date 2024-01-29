import 'dart:io';

import 'package:chatting_app/models/user_model.dart';
import 'package:chatting_app/api/repository/auth_repository.dart';
import 'package:chatting_app/api/service/storage_service.dart';
import 'package:chatting_app/api/service/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final AuthRepository _authRepository;
  final UserService _userService;
  final StorageService _storageService;

  const AuthService._privateConstructor(
    this._authRepository,
    this._userService,
    this._storageService,
  );

  static final AuthService _instance = AuthService._privateConstructor(
    AuthRepository.instance(),
    UserService.instance(),
    StorageService.instance(),
  );

  factory AuthService.instance() {
    return _instance;
  }

  Future<String?> login(String email, String password) async {
    final uid = await _authRepository.login(email, password).then((value) {
      return value.user?.uid;
    });

    if (uid != null) {
      await _userService.update(uid, {
        "isOnline": true,
        "lastActive": DateTime.now(),
      });
    }

    return uid;
  }

  Future<void> logout() async {
    final user = await _authRepository.getUser();

    if (user != null) {
      await _userService.update(user.uid, {
        "isOnline": false,
        "lastActive": DateTime.now(),
      });
      await _authRepository.logout();
    }
  }

  Future<String?> register(
      String email, String password, String fullName, File file) async {
    final credentials = await _authRepository.register(email, password);

    if (credentials.user != null) {
      final imageUrl =
          await _storageService.upload(credentials.user!.uid, file);

      final result = await _userService.create(
        UserModel(
          id: credentials.user!.uid,
          fullName: fullName,
          email: email,
          imageUrl: imageUrl,
          lastActive: DateTime.now(),
        ),
      );

      // Applying transaction manually then returning null to indicate failure
      if (result == null) {
        //can't delete user without logging in
        await _authRepository.login(email, password);

        // has to be above deleteUser() method otherwise storage throws permission denied exception
        await _storageService.delete(imageUrl);
        await _authRepository.deleteUser();

        // Failed to add user to FirebaseFirestore
        return null;
      }

      //User created successfully
      return result;
    }

    //Failed to add user to FirebaseAuth
    return null;
  }

  void delete() {
    _authRepository.deleteUser();
  }

  Future<User?> getUser() async {
    return _authRepository.getUser();
  }
}
