import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aladia_flutter_test/core/error/failures.dart';

import 'package:aladia_flutter_test/features/authentication/domain/repositories/repositories.dart';
import 'package:aladia_flutter_test/features/authentication/domain/usecases/signup_usecase.dart';

import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late SignupUserUsecase usecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = SignupUserUsecase(mockAuthRepository);
  });

  const email = 'test@test.com';
  const password = 'password';
  const firstName = 'John';
  const lastName = 'Doe';
  const phoneNumber = '1234567890';

  final params = SignupParams(
    email: email,
    password: password,
    firstName: firstName,
    lastName: lastName,
    phoneNumber: phoneNumber,
  );

  test('should call the repository to sign up the user', () async {
    // Arrange
    when(() => mockAuthRepository.signup(any(), any(), any(), any(), any()))
        .thenAnswer((_) async => Right(null));

    // Act
    final result = await usecase(params);

    // Assert
    expect(result, equals(Right(null)));
    verify(() => mockAuthRepository.signup(
        email, password, firstName, lastName, phoneNumber)).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });

  test('should return a failure when the signup fails', () async {
    // Arrange
    when(() => mockAuthRepository.signup(any(), any(), any(), any(), any()))
        .thenAnswer(
            (_) async => Left(ServerFailure(message: 'error signing up')));

    // Act
    final result = await usecase(params);

    // Assert
    expect(result, equals(Left(ServerFailure(message: 'error signing up'))));
    verify(() => mockAuthRepository.signup(
        email, password, firstName, lastName, phoneNumber)).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });
}
