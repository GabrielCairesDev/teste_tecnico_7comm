abstract class LoginState {
  final String usermame;
  final String password;

  LoginState({this.usermame = '', this.password = ''});
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginNoOTPSecret extends LoginState {}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure(this.error);
}

class LoginUserNameValue extends LoginState {
  LoginUserNameValue(String username) : super(usermame: username);
}

class LoginPasswordValue extends LoginState {
  LoginPasswordValue(String password) : super(password: password);
}
