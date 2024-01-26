import 'package:chatting_app/models/entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BaseRepository<T extends Entity> {
  final CollectionReference<T> _collection;

  const BaseRepository(this._collection);

  Future<void> create(T model) async {
    await _collection.doc(model.id).set(model);
  }

  Future<void> update(String id, Map<String, dynamic> data) async {
    await _collection.doc(id).update(data);
  }

  Future<void> delete(String id) async {
    await _collection.doc(id).delete();
  }

  Future<DocumentSnapshot<T>> get(String id) async {
    return _collection.doc(id).get();
  }

  Future<QuerySnapshot<T>> getAll() async {
    return _collection.get();
  }

  Future<Stream<QuerySnapshot<T>>> getStream() async {
    return _collection.snapshots();
  }
}