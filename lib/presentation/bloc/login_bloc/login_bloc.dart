import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/presentation/bloc/login_bloc/login_event.dart';
import 'package:quiz_app/presentation/bloc/login_bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginTextChangedEvent>((event, emit) {
      if (event.emailValue == "" || event.passwordValue == "") {
        emit(LoginErrorState("Invalid username or password"));
      } else if (EmailValidator.validate(event.emailValue) == false) {
        emit(LoginErrorState("Invalid email address"));
      } else if (event.passwordValue.length < 7) {
        emit(LoginErrorState("Invalid password"));
      } else {
        emit(LoginValidState());
      }
    });
    on<LoginInvalidEvent>((event, emit) {
      if (event.emailValue == "" || event.passwordValue == "") {
        emit(LoginErrorState("Email and password is required"));
      }
    });
    on<LoginSubmittedEvent>((event, emit) {
      emit(LoginValidState());
    });
  }
}
