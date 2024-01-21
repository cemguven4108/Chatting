import 'package:chatting_app/repository/auth_repository.dart';
import 'package:chatting_app/service/storage_service.dart';
import 'package:chatting_app/service/user_service.dart';

class AuthService {
  final AuthRepository authRepository;
  final UserService userService;
  final StorageService storageService;

  const AuthService(
    this.authRepository,
    this.userService,
    this.storageService,
  );

  Future<String?> login(String email, String password) async {
    return await authRepository.login(email, password).then((value) {
      return value.user?.uid;
    });
  }

  bool logout() {
    authRepository.logout();

    if (authRepository.getUser() == null) {
      return false;
    }
    return true;
  }

  Future<String?> register(
    String email,
    String password,
    String fullName,
    String imageUrl,
  ) async {
    final result = await authRepository.register(email, password);
  }
}
