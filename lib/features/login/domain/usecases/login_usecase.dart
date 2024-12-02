import 'package:dartz/dartz.dart';
import 'package:flutter_dev_test/features/login/domain/repositories/login_repository.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  Future<Either<String, bool>> call(String username, String password, String code) async {
    try {
      final result = await authRepository.login(username, password, code);
      return result ? Right(result) : const Left('Credenciais inválidas.');
    } catch (e) {
      return const Left('Erro ao realizar login.');
    }
  }
}
