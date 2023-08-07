import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/presentation/bloc/login_bloc/login_event.dart';
import 'package:quiz_app/presentation/bloc/login_bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginTextChangedEvent>((event, emit) {
      if (event.emailValue == "" || event.passwordValue == "") {
        emit(state.copyWith(
            errorMessage: "Invalid username or password",
            fieldUntouched: event.fieldUntouched));
      } else if (EmailValidator.validate(event.emailValue) == false) {
        emit(state.copyWith(
            errorMessage: "Invalid email address",
            fieldUntouched: event.fieldUntouched));
      } else {
        emit(state.copyWith(
            errorMessage: "", fieldUntouched: event.fieldUntouched));
      }
    });

    on<LoginInvalidEvent>((event, emit) async {
      if (event.fieldUntouched == 1) {
        emit(state.copyWith(
            errorMessage: "Email and password is required",
            fieldUntouched: event.fieldUntouched));
      } else {
        emit(state.copyWith(
            errorMessage: "Wrong Credentials",
            fieldUntouched: event.fieldUntouched));
      }
    });

    on<LoginSubmittedEvent>((event, emit) {
      emit(state.copyWith(
          errorMessage: "", fieldUntouched: event.fieldUntouched));
    });
  }
}
