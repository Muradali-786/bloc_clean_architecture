import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<bool> setValue(String key, String value) async {
    await _storage.write(key: key, value: value);

    return true;
  }

  Future<dynamic> getValue(String key) async {
    return await _storage.read(key: key);
  }

  Future<bool> clearValue(String key) async {
    await _storage.delete(key: key);
    return true;
  }
}
