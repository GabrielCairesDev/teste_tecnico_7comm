import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_test/features/login/domain/usecases/login_usecase.dart';
import 'package:flutter_dev_test/service/otp_service.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  final _otpService = OTPService();

  LoginBloc(this.loginUseCase) : super(LoginInitial()) {
    on<LoginSubmitted>((event, emit) async {
      emit(LoginLoading());

      String getCode = await _otpService.getOTPSecret(event.username);
      if (getCode == '') {
        emit(LoginNoOTPSecret());
        return;
      }

      final result = await loginUseCase(event.username, event.password, getCode);

      result.fold(
        (errorMessage) => emit(LoginFailure(errorMessage)),
        (success) => emit(LoginSuccess()),
      );
    });

    on<LoginUsernameChanged>((event, emit) => emit(LoginUserNameValue(event.username)));
    on<LoginPasswordChanged>((event, emit) => emit(LoginPasswordValue(event.password)));
  }
}
