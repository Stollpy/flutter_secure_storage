import 'package:flutter/foundation.dart';
import "package:flutter_secure_storage/flutter_secure_storage.dart";
import 'package:secure_storage/cookies_manager.dart';


class SecureStorage {
  final dynamic _storage = kIsWeb ? CookiesManager() : const FlutterSecureStorage();

  Future<bool> containsKey({required String key}) {
      return _storage.containsKey(key: key);
  }

  Future<void> delete({required String key}) {
    return _storage.delete(key: key);
  }

  Future<void> deleteAll() {
    return _storage.deleteAll();
  }

  Future<String?> read({required String key}) {
    return _storage.read(key: key);
  }

  Future<Map<String, String>> readAll() {
    return _storage.readAll();
  }

  Future<void> write({required String key, String? value}) async {
    await _storage.write(key: key, value: value);
  }
}