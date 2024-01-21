import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  final CollectionReference _collection;

  const UserRepository(this._collection);

  Future<void> create(Map<String, dynamic> data) async {
    _collection.doc(data["id"]).set(data);
  }

  Future<void> update(String id, Map<String, dynamic> data) async {
    _collection.doc(id).update(data);
  }

  Future<void> delete(String id) async {
    _collection.doc(id).delete();
  }

  Future<DocumentSnapshot<Object?>> get(String id) async {
    return _collection.doc(id).get();
  }

  Future<QuerySnapshot<Object?>> getAll() async {
    return _collection.get();
  }

  Future<Stream<QuerySnapshot<Object?>>> getStream() async {
    return _collection.snapshots();
  }
}