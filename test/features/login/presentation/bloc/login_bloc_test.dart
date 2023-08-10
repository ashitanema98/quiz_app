import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz_app/features/login/domain/usecase/auth_usecase.dart';
import 'package:quiz_app/features/login/presentation/bloc/login_bloc.dart';
import 'package:quiz_app/features/login/presentation/bloc/login_event.dart';
import 'package:quiz_app/features/login/presentation/bloc/login_state.dart';

class MockLoginState extends Mock implements LoginState {}

class MockAuth extends Mock implements Auth {}

void main() {
  late LoginBloc loginBloc;
  setUp(() {
    loginBloc = LoginBloc();
  });
  tearDown(() {
    loginBloc.close();
  });

  group('LoginBloc', () {
    test('initial state is correct', () {
      //assert
      expect(loginBloc.state, const LoginState());
    });
  });

  test(
      'emits correct state for LoginTextChangedEvent - empty email and password',
      () {
    //arrange
    final event = LoginTextChangedEvent('', '', 0);

    final expectedStates = [
      const LoginState(
          errorMessage: 'Invalid username or password', fieldUntouched: 0),
    ];

//act
    loginBloc.add(event);

//assert
    expectLater(
      loginBloc.stream,
      emitsInOrder(expectedStates),
    );
  });

  test(
      'emits LoginErrorState when LoginTextChangedEvent is added with invalid email',
      () {
    //arrange
    const emailValue = 'invalid';
    const passwordValue = 'short';
    final expectedStates = [
      const LoginState(
          errorMessage: 'Invalid email address', fieldUntouched: 0),
    ];

//act
    loginBloc.add(LoginTextChangedEvent(emailValue, passwordValue, 0));

//assert
    expectLater(
      loginBloc.stream,
      emitsInOrder(expectedStates),
    );
  });

  test(
      'emits LoginErrorState when LoginInvalidEvent is added if user presses login button directly with empty credentials ',
      () {
    //arrange
    const emailValue = '';
    const passwordValue = '';
    final expectedStates = [
      const LoginState(
          errorMessage: 'Email and password is required', fieldUntouched: 1),
    ];

//act
    loginBloc.add(LoginInvalidEvent(emailValue, passwordValue, 1));

//assert
    expectLater(
      loginBloc.stream,
      emitsInOrder(expectedStates),
    );
  });

  test('emits correct state for failed authentication', () async {
    //arrange
    const emailValue = 'invalid_email@example.com';
    const passwordValue = 'invalid_password';

    final expectedStates = [
      const LoginState(errorMessage: 'Wrong Credentials', fieldUntouched: 0),
    ];

//act
    loginBloc.add(LoginInvalidEvent(emailValue, passwordValue, 0));

//assert
    expectLater(
      loginBloc.stream,
      emitsInOrder(expectedStates),
    );
  });

  test('emits correct state for successful authentication', () async {
    //arrange
    const emailValue = 'valid_email@example.com';
    const passwordValue = 'valid_password';

    final expectedStates = [
      const LoginState(errorMessage: '', fieldUntouched: 0),
    ];

    //act
    loginBloc.add(LoginSubmittedEvent(emailValue, passwordValue, 0));

    //assert
    expectLater(
      loginBloc.stream,
      emitsInOrder(expectedStates),
    );
  });
}
