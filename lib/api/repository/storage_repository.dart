import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageRepository {
  final FirebaseStorage _firebaseStorage;

  const StorageRepository._privateConstructor(this._firebaseStorage);

  static final StorageRepository _instance =
      StorageRepository._privateConstructor(FirebaseStorage.instance);

  factory StorageRepository.instance() {
    return _instance;
  }

  const StorageRepository(this._firebaseStorage);

  Future<String> upload(String id, File file) async {
    final result = await _firebaseStorage
        .ref()
        .child("images")
        .child("$id.jpg")
        .putFile(file);

    return result.ref.getDownloadURL();
  }

  Future<void> delete(String url) async {
    await _firebaseStorage.refFromURL(url).delete();
  }
}
