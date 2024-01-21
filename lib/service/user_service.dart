import 'package:chatting_app/models/user_model.dart';
import 'package:chatting_app/repository/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final UserRepository _userRepository;

  const UserService(this._userRepository);

  Future<String?> create(UserModel userModel) async {
    await _userRepository.create(
      userModel.toJson(),
    );

    final result = await getUser(userModel.id);

    if (result != null) {
      return userModel.id;
    }
    return null;
  }

  void update(String id, String fullName) async {
    await _userRepository.update(
      id,
      {"fullName": fullName},
    );
  }

  void delete(String id) async {
    _userRepository.delete(id);
  }

  Future<UserModel?> getUser(String id) async {
    final doc =
        await _userRepository.get(id) as DocumentSnapshot<Map<String, dynamic>>;

    if (doc.data() == null) {
      return null;
    }

    return UserModel.fromJson(doc.data()!);
  }

  Future<List<UserModel>> getAll() async {
    final snapshot =
        await _userRepository.getAll() as QuerySnapshot<Map<String, dynamic>>;

    return snapshot.docs.map((doc) => UserModel.fromJson(doc.data())).toList();
  }

  Future<Stream<List<UserModel>>> getStream() async {
    final stream = await _userRepository.getStream()
        as Stream<QuerySnapshot<Map<String, dynamic>>>;

    return stream.map((snapshot) => snapshot.docs
        .map(
          (doc) => UserModel.fromJson(doc.data()),
        )
        .toList());
  }
}
