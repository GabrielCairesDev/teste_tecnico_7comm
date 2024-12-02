import 'package:flutter_dev_test/constants/endpoint.dart';
import 'package:flutter_dev_test/core/network/dio_client.dart';
import 'package:flutter_dev_test/service/otp_service.dart';

abstract class OtpRepository {
  Future<bool> sendOTP(String username, String password, String otp);
}

class OtpRepositoryImpl implements OtpRepository {
  final DioClient dioClient;

  OtpRepositoryImpl(this.dioClient);

  @override
  Future<bool> sendOTP(String username, String password, String otp) async {
    try {
      final data = {
        'username': username,
        'password': password,
        'code': otp,
      };

      final response = await dioClient.client.post(Endpoints.otp, data: data);

      if (response.statusCode == 200 && response.data['totp_secret'] != null) {
        await OTPService().saveOTPSecret(response.data['totp_secret'], username);

        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
