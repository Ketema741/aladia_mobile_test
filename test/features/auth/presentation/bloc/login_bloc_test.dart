import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aladia_flutter_test/core/error/failures.dart';
import 'package:aladia_flutter_test/features/authentication/domain/usecases/signin_usecase.dart';
import 'package:aladia_flutter_test/features/authentication/presentation/bloc/login_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockSigninUserUsecase extends Mock implements SigninUserUsecase {}

void main() {
  late MockSigninUserUsecase mockSigninUserUsecase;
  late LoginBloc loginBloc;

  setUp(() {
    mockSigninUserUsecase = MockSigninUserUsecase();
    loginBloc = LoginBloc(loginUseCase: mockSigninUserUsecase);
  });

  group('LoginBloc', () {
    blocTest<LoginBloc, LoginState>(
      'emits [LoginLoadingState, LoginSuccessState] when LoginButtonPressedEvent is added',
      build: () {
        const loginParams = LoginParams(
          email: 'test@test.com',
          password: 'password123',
        );
        when(() => mockSigninUserUsecase.call(loginParams))
            .thenAnswer((_) async => const Right('mock_token'));

        return loginBloc;
      },
      act: (bloc) => bloc.add(LoginButtonPressedEvent(
        email: 'test@test.com',
        password: 'password123',
      )),
      expect: () => [
        LoginLoadingState(),
        LoginSuccessState(token: 'mock_token'),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'emits [LoginLoadingState, LoginFailureState] when LoginButtonPressedEvent is added and fails',
      build: () {
        const loginParams = LoginParams(
          email: 'test@test.com',
          password: 'password123',
        );
        when(() => mockSigninUserUsecase.call(loginParams)).thenAnswer(
            (_) async =>
                const Left(ServerFailure(message: 'error signing in')));

        return loginBloc;
      },
      act: (bloc) => bloc.add(LoginButtonPressedEvent(
        email: 'test@test.com',
        password: 'password123',
      )),
      expect: () => [
        LoginLoadingState(),
        LoginFailureState(error: 'error signing in'),
      ],
    );
  });
}
