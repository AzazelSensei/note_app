// ignore_for_file: depend_on_referenced_packages, unused_field

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenSecureStorage {
  static const String _token = 'token';

  final storage = const FlutterSecureStorage();

  Future<void> saveToken(String token) async {
    await storage.write(key: _token, value: token);
  }

  Future<String?> get getToken async {
    return await storage.read(key: _token);
  }
}
