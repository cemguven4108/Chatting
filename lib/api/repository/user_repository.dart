import 'package:chatting_app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository<T extends CollectionReference<UserModel>> {
  final T _collection;

  const UserRepository(this._collection);

  Future<void> create(UserModel userModel) async {
    _collection.doc(userModel.id).set(userModel);
  }

  Future<void> update(String id, Map<String, dynamic> data) async {
    _collection.doc(id).update(data);
  }

  Future<void> delete(String id) async {
    _collection.doc(id).delete();
  }

  Future<DocumentSnapshot<UserModel>> get(String id) async {
    return _collection.doc(id).get();
  }

  Future<QuerySnapshot<UserModel>> getAll() async {
    return _collection.get();
  }

  Future<Stream<QuerySnapshot<UserModel>>> getStream() async {
    return _collection.snapshots();
  }
}