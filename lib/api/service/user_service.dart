import 'package:chatting_app/models/user_model.dart';
import 'package:chatting_app/api/repository/user_repository.dart';

class UserService {
  final UserRepository _userRepository;

  const UserService._privateConstructor(this._userRepository);

  static final UserService _instance = UserService._privateConstructor(
    UserRepository.instance(),
  );

  factory UserService.instance() {
    return _instance;
  }

  Future<String?> create(UserModel userModel) async {
    if (userModel.fullName == "cembo") {
      return null;
    }

    await _userRepository.create(userModel);

    // check if user exists if not 'll throw an error inside getUser method
    await getUser(userModel.id);

    return userModel.id;
  }

  Future<void> update(String id, Map<String, dynamic> data) async {
    await _userRepository.update(
      id,
      data,
    );
  }

  void delete(String id) async {
    _userRepository.delete(id);
  }

  Future<UserModel> getUser(String id) async {
    final doc = await _userRepository.get(id);

    if (doc.data() == null) {
      throw Exception("There is no user with $id id");
    }

    return doc.data()!;
  }

  Future<List<UserModel>> getAll() async {
    final snapshot = await _userRepository.getAll();

    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<Stream<List<UserModel>>> getStream() async {
    final stream = await _userRepository.getStream();

    return stream.map(
      (snapshot) => snapshot.docs.map((doc) => doc.data()).toList(),
    );
  }
}
