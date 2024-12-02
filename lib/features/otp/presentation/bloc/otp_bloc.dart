import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_test/features/otp/domain/usecases/otp_usecase.dart';
import 'package:flutter_dev_test/features/otp/presentation/bloc/otp_event.dart';
import 'package:flutter_dev_test/features/otp/presentation/bloc/otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final OtpUsecase otpUsecase;

  OtpBloc(this.otpUsecase) : super(OtpInitial()) {
    on<OtpSubmitted>((event, emit) async {
      emit(OtpLoading());
      final result = await otpUsecase(event.username, event.password, event.otp);

      result.fold(
        (erroMessage) => emit(OtpFailure(erroMessage)),
        (success) => emit(OtpSuccess()),
      );
    });

    on<OtpChanged>((event, emit) => emit(OtpValue(event.newOtp)));
  }
}
