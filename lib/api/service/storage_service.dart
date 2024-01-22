import 'dart:io';

import 'package:chatting_app/api/repository/storage_repository.dart';

class StorageService {
  final StorageRepository _storageRepository;

  const StorageService(this._storageRepository);

  Future<String> upload(String id, File file) {
    return _storageRepository.upload(id, file);
  }

  Future<void> delete(String url) async {
    _storageRepository.delete(url);
  }

  Future<String> getImage(String imageUrl) {
    return _storageRepository.getDownloadUrl(imageUrl);
  }
}