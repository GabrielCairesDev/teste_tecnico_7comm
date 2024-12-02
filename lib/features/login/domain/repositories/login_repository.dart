import 'package:flutter_dev_test/constants/endpoint.dart';
import 'package:flutter_dev_test/core/network/dio_client.dart';
import 'package:otp/otp.dart';

abstract class AuthRepository {
  Future<bool> login(String username, String password, String code);
}

class AuthRepositoryImpl implements AuthRepository {
  final DioClient dioClient;

  AuthRepositoryImpl(this.dioClient);

  @override
  Future<bool> login(String username, String password, String code) async {
    String codeTOP = await generateTOTP(code);

    try {
      final data = {
        'username': username,
        'password': password,
        'totp_code': codeTOP,
      };

      final response = await dioClient.client.post(Endpoints.login, data: data);

      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  Future<String> generateTOTP(String secret) async {
    return OTP.generateTOTPCodeString(
      secret,
      DateTime.now().millisecondsSinceEpoch,
      interval: 30,
      algorithm: Algorithm.SHA1,
      isGoogle: true,
    );
  }
}
