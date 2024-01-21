import 'dart:io';

import 'package:chatting_app/repository/storage_repository.dart';

class StorageService {
  final StorageRepository _storageRepository;

  const StorageService(this._storageRepository);

  Future<String> upload(String id, File file) {
    return _storageRepository.upload(id, file);
  }

  Future<void> delete(String url) async {
    _storageRepository.delete(url);
  }
}