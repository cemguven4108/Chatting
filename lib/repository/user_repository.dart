import 'package:chatting_app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  final CollectionReference collection;

  const UserRepository(this.collection);

  Future<void> create(UserModel userModel) async {
    return Future(() => true);
  }

  Future<void> update(UserModel userModel) async {
    return Future(() => true);
  }

  Future<void> delete(String id) async {
    return Future(() => true);
  }

  Future<UserModel?> get(String id) async {
    return Future(() => null);
  }

  Future<List<UserModel>> getAll() async {
    return Future(() => []);
  }
}