import 'dart:io';

import 'package:chatting_app/api/repository/storage_repository.dart';

class StorageService {
  final StorageRepository _storageRepository;

  const StorageService._privateConstructor(this._storageRepository);

  static final StorageService _instance = StorageService._privateConstructor(
    StorageRepository.instance(),
  );

  factory StorageService.instance() {
    return _instance;
  }

  Future<String> upload(String id, File file) {
    return _storageRepository.upload(id, file);
  }

  Future<void> delete(String url) async {
    _storageRepository.delete(url);
  }
}
