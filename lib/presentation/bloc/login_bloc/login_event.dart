abstract class LoginEvent {}

class LoginTextChangedEvent extends LoginEvent {
  final String emailValue;
  final String passwordValue;
  LoginTextChangedEvent(this.emailValue, this.passwordValue);
}

class LoginInvalidEvent extends LoginEvent {
  final String emailValue;
  final String passwordValue;
  LoginInvalidEvent(this.emailValue, this.passwordValue);
}

class LoginSubmittedEvent extends LoginEvent {
  final String email;
  final String password;
  LoginSubmittedEvent(this.email, this.password);
}
