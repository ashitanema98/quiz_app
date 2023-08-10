import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final String errorMessage;
  final int fieldUntouched;

  const LoginState({this.errorMessage = '', this.fieldUntouched = 1});

  @override
  List<Object?> get props => [errorMessage, fieldUntouched];

  LoginState copyWith({
    String? errorMessage,
    int? fieldUntouched,
  }) {
    return LoginState(
      errorMessage: errorMessage ?? this.errorMessage,
      fieldUntouched: fieldUntouched ?? this.fieldUntouched,
    );
  }
}
