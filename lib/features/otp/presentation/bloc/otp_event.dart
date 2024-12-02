abstract class OtpEvent {}

class OtpSubmitted extends OtpEvent {
  final String username;
  final String password;
  final String otp;

  OtpSubmitted(this.username, this.password, this.otp);
}

class OtpChanged extends OtpEvent {
  final String newOtp;

  OtpChanged(this.newOtp);
}
