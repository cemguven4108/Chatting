import 'dart:io';

import 'package:chatting_app/models/user_model.dart';
import 'package:chatting_app/api/repository/auth_repository.dart';
import 'package:chatting_app/api/service/storage_service.dart';
import 'package:chatting_app/api/service/user_service.dart';

class AuthService {
  final AuthRepository _authRepository;
  final UserService _userService;
  final StorageService _storageService;

  const AuthService(
    this._authRepository,
    this._userService,
    this._storageService,
  );

  Future<String?> login(String email, String password) async {
    return await _authRepository.login(email, password).then((value) {
      return value.user?.uid;
    });
  }

  bool logout() {
    _authRepository.logout();

    if (_authRepository.getUser() == null) {
      return false;
    }
    return true;
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
}
