import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class OTPService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> saveOTPSecret(String secret, String key) async {
    await _storage.write(key: key, value: secret);
  }

  Future<String> getOTPSecret(String key) async {
    try {
      String? secret = await _storage.read(key: key);
      return secret ?? '';
    } catch (e) {
      return '';
    }
  }
}
