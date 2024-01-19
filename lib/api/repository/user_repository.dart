import 'package:chatting_app/configuration/firebase_configuration.dart';
import 'package:chatting_app/models/user_model.dart';

class UserRepository {
  final userCollection = firebaseFirestore.collection("users");

  Future<String> create(UserModel user) async {
    await userCollection.doc(user.id).set(
          user.toJson(),
        );

    return userCollection.doc(user.id).id;
  }

  Future<String> update(UserModel user) async {
    await userCollection.doc(user.id).update(
          user.toJson(),
        );

    return userCollection.doc(user.id).id;
  }

  Future<void> delete(String id) async {
    await userCollection.doc(id).delete();
  }

  Future<UserModel?> getById(String id) async {
    final user = await userCollection.doc(id).get();

    if (user.data() != null) {
      return UserModel.fromJson(user.data()!);
    }
    return null;
  }

  Future<List<UserModel?>> getAll() async {
    final users = await userCollection.get();

    return users.docs.map((doc) {
      return UserModel.fromJson(doc.data());
    }).toList();
  }
}
