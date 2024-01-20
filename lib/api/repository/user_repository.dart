import 'package:chatting_app/configuration/firebase_configuration.dart';
import 'package:chatting_app/models/user_model.dart';

class UserRepository {
  final _userCollection = firebaseFirestore.collection("users");

  Future<void> addUser(UserModel userModel) async {
    await _userCollection.doc(userModel.id).set(
          userModel.toJson(),
        );
  }

  Future<void> updateUser(UserModel userModel) async {
    await _userCollection.doc(userModel.id).update(
          userModel.toJson(),
        );
  }

  Future<void> deleteUser(String id) async {
    await _userCollection.doc(id).delete();
  }

  Future<UserModel?> getUser(String id) async {
    final user = await _userCollection.doc(id).get();

    if (user.data() != null) {
      return UserModel.fromJson(user.data()!);
    }
    return null;
  }

  Future<Stream<List<UserModel>>> getAllUsers() async {
    return _userCollection.snapshots().map((query) {
      return query.docs
          .map(
            (doc) => UserModel.fromJson(doc.data()),
          )
          .toList();
    });
  }
}
