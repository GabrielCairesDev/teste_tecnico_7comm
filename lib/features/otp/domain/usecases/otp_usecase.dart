import 'package:dartz/dartz.dart';
import 'package:flutter_dev_test/features/otp/domain/repositories/otp_repository.dart';

class OtpUsecase {
  final OtpRepository otpRepository;

  OtpUsecase(this.otpRepository);

  Future<Either<String, bool>> call(String username, String password, String otp) async {
    try {
      final result = await otpRepository.sendOTP(username, password, otp); // Retorno esperado de bool
      return result ? Right(result) : const Left('Erro ao enviar OTP.');
    } catch (e) {
      return const Left('Erro ao enviar OTP.');
    }
  }
}
