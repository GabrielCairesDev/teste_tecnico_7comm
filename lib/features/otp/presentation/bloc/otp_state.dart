abstract class OtpState {
  final String otp;

  OtpState({this.otp = ''});
}

class OtpInitial extends OtpState {}

class OtpLoading extends OtpState {}

class OtpSuccess extends OtpState {}

class OtpFailure extends OtpState {
  final String error;

  OtpFailure(this.error) : super(otp: '');
}

class OtpValue extends OtpState {
  OtpValue(String otp) : super(otp: otp);
}
