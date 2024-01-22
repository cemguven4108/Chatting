import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageRepository {
  final FirebaseStorage _firebaseStorage;

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
    await _firebaseStorage.ref(url).delete();
  }
}
