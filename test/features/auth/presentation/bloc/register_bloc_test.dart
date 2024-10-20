import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aladia_flutter_test/core/error/failures.dart';
import 'package:aladia_flutter_test/features/authentication/domain/usecases/signup_usecase.dart';
import 'package:aladia_flutter_test/features/authentication/presentation/bloc/register_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockSignupUserUsecase extends Mock implements SignupUserUsecase {}

void main() {
  late MockSignupUserUsecase mockSignupUserUsecase;
  late RegisterBloc registerBloc;

  setUp(() {
    mockSignupUserUsecase = MockSignupUserUsecase();
    registerBloc = RegisterBloc(registerUseCase: mockSignupUserUsecase);
  });

  group('RegisterBloc', () {
    blocTest<RegisterBloc, RegisterState>(
      'emits [RegisterLoadingState, RegisterSuccessState] when RegisterButtonPressedEvent is added',
      build: () {
        const signupParams = SignupParams(
          email: 'test@test.com',
          password: 'password123',
          firstName: 'John',
          lastName: 'Doe',
          phoneNumber: '1234567890',
        );

        when(() => mockSignupUserUsecase.call(signupParams))
            .thenAnswer((_) async => const Right(null));

        return registerBloc;
      },
      act: (bloc) => bloc.add(RegisterButtonPressedEvent(
        email: 'test@test.com',
        password: 'password123',
        firstName: 'John',
        lastName: 'Doe',
        phoneNumber: '1234567890',
      )),
      expect: () => [
        RegisterLoadingState(),
        RegisterSuccessState(),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'emits [RegisterLoadingState, RegisterFailureState] when RegisterButtonPressedEvent is added and fails',
      build: () {
        const signupParams = SignupParams(
          email: 'test@test.com',
          password: 'password123',
          firstName: 'John',
          lastName: 'Doe',
          phoneNumber: '1234567890',
        );

        when(() => mockSignupUserUsecase.call(signupParams)).thenAnswer(
            (_) async =>
                const Left(ServerFailure(message: 'error signing up')));

        return registerBloc;
      },
      act: (bloc) => bloc.add(RegisterButtonPressedEvent(
        email: 'test@test.com',
        password: 'password123',
        firstName: 'John',
        lastName: 'Doe',
        phoneNumber: '1234567890',
      )),
      expect: () => [
        RegisterLoadingState(),
        RegisterFailureState(error: 'error signing up'),
      ],
    );
  });
}
