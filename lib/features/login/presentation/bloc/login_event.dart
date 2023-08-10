abstract class LoginEvent {}

class LoginTextChangedEvent extends LoginEvent {
  final String emailValue;
  final String passwordValue;
  final int fieldUntouched;
  LoginTextChangedEvent(
      this.emailValue, this.passwordValue, this.fieldUntouched);
}

class LoginInvalidEvent extends LoginEvent {
  final String emailValue;
  final String passwordValue;
  final int fieldUntouched;
  LoginInvalidEvent(this.emailValue, this.passwordValue, this.fieldUntouched);
}

class LoginSubmittedEvent extends LoginEvent {
  final String email;
  final String password;
  final int fieldUntouched;
  LoginSubmittedEvent(this.email, this.password, this.fieldUntouched);
}
