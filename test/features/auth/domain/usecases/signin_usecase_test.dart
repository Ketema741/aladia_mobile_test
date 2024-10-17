import 'package:dartz/dartz.dart';
import 'package:aladia_flutter_test/core/error/failures.dart';
import 'package:aladia_flutter_test/features/authentication/domain/repositories/auth_repository.dart';
import 'package:aladia_flutter_test/features/authentication/domain/usecases/signin_usecase.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late SigninUserUsecase usecase; 
  late MockAuthRepository mockRepository; 

  setUp(() {
    mockRepository = MockAuthRepository();
    usecase = SigninUserUsecase(mockRepository);
  });

  group('call', () {
    test('should return token from the repository when sign-in is successful',
        () async {
      // Arrange
      const email = 'test@example.com';
      const password = 'password123';
      const params = LoginParams(email: email, password: password);
      const expectedToken = 'mock_token';

      when(() => mockRepository.signin(email, password))
          .thenAnswer((_) async => const Right(expectedToken));

      // Act
      final result = await usecase(params);

      // Assert
      expect(result, const Right(expectedToken));
      verify(() => mockRepository.signin(email, password)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return a failure from the repository when sign-in fails',
        () async {
      // Arrange
      const email = 'test@example.com';
      const password = 'password123';
      const params = LoginParams(email: email, password: password);
      const failure = ServerFailure(message: 'Error signing in');

      when(() => mockRepository.signin(email, password))
          .thenAnswer((_) async => const Left(failure));

      // Act
      final result = await usecase(params);

      // Assert
      expect(result, const Left(failure));
      verify(() => mockRepository.signin(email, password)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
