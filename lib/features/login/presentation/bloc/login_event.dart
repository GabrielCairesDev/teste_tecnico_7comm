abstract class LoginEvent {}

class LoginSubmitted extends LoginEvent {
  LoginSubmitted(this.username, this.password);

  final String username;
  final String password;
}

class LoginUsernameChanged extends LoginEvent {
  final String username;

  LoginUsernameChanged(this.username);
}

class LoginPasswordChanged extends LoginEvent {
  final String password;

  LoginPasswordChanged(this.password);
}
