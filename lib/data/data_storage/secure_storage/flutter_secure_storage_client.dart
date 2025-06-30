import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@singleton
base class FlutterSecureStorageClient {
  FlutterSecureStorageClient() : _storage = const FlutterSecureStorage();

  final FlutterSecureStorage _storage;

  Future<bool> containsKey(String key) async {
    final allKeys = await _storage.readAll();
    return allKeys.containsKey(key);
  }

  Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  Future<void> write(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}
