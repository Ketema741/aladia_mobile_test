import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:aladia_flutter_test/features/authentication/data/data_source/auth_remote_data_source.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;
import 'package:aladia_flutter_test/core/error/exception.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late AuthRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = AuthRemoteDataSourceImpl(client: mockHttpClient);
  });

  setUpAll(() {
    registerFallbackValue(Uri.parse('https://hakimhub-backend.onrender.com/api/user/register'));
  });

  group('signup', () {
    test('should perform a POST request with the correct body', () async {
      // Arrange
      const email = 'test@test.com';
      const password = 'password';
      const firstName = 'John';
      const lastName = 'Doe';
      const phoneNumber = '1234567890';
      when(() => mockHttpClient.post(any(), body: any(named: 'body')))
          .thenAnswer((_) async => http.Response('', 200));

      // Act
      await dataSource.signup(
          email, password, firstName, lastName, phoneNumber);

      // Assert
      verify(() => mockHttpClient.post(
            Uri.parse(
                'https://hakimhub-backend.onrender.com/api/user/register'),
            body: {
              'email': email,
              'password': password,
              'firstName': firstName,
              'lastName': lastName,
              'phoneNumber': phoneNumber,
            },
          ));
    });

    test(
        'should throw a ServerException if the response status code is not 200',
        () async {
      // Arrange
      const email = 'test@test.com';
      const password = 'password';
      const firstName = 'John';
      const lastName = 'Doe';
      const phoneNumber = '1234567890';
      when(() => mockHttpClient.post(any(), body: any(named: 'body')))
          .thenAnswer((_) async => http.Response('Error message', 404));

      // Act
      final call = dataSource.signup;

      // Assert
      expect(() => call(email, password, firstName, lastName, phoneNumber),
          throwsA(isA<ServerException>()));
    });
  });

  group('signin', () {
    test('should return token when the call is successful', () async {
      // Arrange
      const email = 'test@example.com';
      const password = 'password123';
      const expectedToken = 'mock_token';

      final expectedResponse = http.Response(
        jsonEncode({
          'data': {'token': expectedToken}
        }),
        200,
      );

      when(() => mockHttpClient.post(any(), body: any(named: 'body')))
          .thenAnswer((_) async => expectedResponse);

      // Act
      final result = await dataSource.signin(email, password);

      // Assert
      expect(result, expectedToken);
      verify(() => mockHttpClient.post(
            Uri.parse('https://hakimhub-backend.onrender.com/api/user/login'),
            body: {
              'email': email,
              'password': password,
            },
          )).called(1);
    });

    test('should throw a ServerException when the call is unsuccessful', () {
      // Arrange
      const email = 'test@example.com';
      const password = 'password123';

      final expectedResponse = http.Response('Error message', 404);

      when(() => mockHttpClient.post(any(), body: any(named: 'body')))
          .thenAnswer((_) async => expectedResponse);

      // Act
      final call = dataSource.signin;

      // Assert
      expect(
          () => call(email, password),
          throwsA(isA<ServerException>()
              .having((e) => e.message, 'message', 'Error message')));
      verify(() => mockHttpClient.post(
            Uri.parse('https://hakimhub-backend.onrender.com/api/user/login'),
            body: {
              'email': email,
              'password': password,
            },
          )).called(1);
    });
  });

  group('AuthRemoteDataSource', () {
    late MockHttpClient mockHttpClient;
    late AuthRemoteDataSourceImpl dataSource;

    setUp(() {
      mockHttpClient = MockHttpClient();
      dataSource = AuthRemoteDataSourceImpl(client: mockHttpClient);
    });

    test('verifyOtp should return success message when the call is successful',
        () async {
      // Arrange
      const String email = 'test@example.com';
      const String otp = '123456';
      const String expectedMessage = 'OTP Verified Successfully';
      when(() => mockHttpClient.post(
          Uri.parse(
              'https://hakimhub-backend.onrender.com/api/user/verify-email'),
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
          body:
              jsonEncode({'email': email, 'code': otp}))).thenAnswer(
          (_) async =>
              http.Response(jsonEncode({'message': expectedMessage}), 200));

      // Act
      final result = await dataSource.verifyOtp(email: email, otp: otp);

      // Assert
      expect(result, expectedMessage);
      verify(() => mockHttpClient.post(
          Uri.parse(
              'https://hakimhub-backend.onrender.com/api/user/verify-email'),
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
          body: jsonEncode({'email': email, 'code': otp}))).called(1);
    });

    test('verifyOtp should throw ServerException when the call is unsuccessful',
        () async {
      // Arrange
      const String email = 'test@example.com';
      const String otp = '123456';
      const String errorMessage = 'Invalid OTP';
      when(() => mockHttpClient.post(
          Uri.parse(
              'https://hakimhub-backend.onrender.com/api/user/verify-email'),
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
          body:
              jsonEncode({'email': email, 'code': otp}))).thenAnswer(
          (_) async =>
              http.Response(jsonEncode({'message': errorMessage}), 400));

      // Act & Assert
      expect(() async => await dataSource.verifyOtp(email: email, otp: otp),
          throwsA(isA<ServerException>()));
      verify(() => mockHttpClient.post(
          Uri.parse(
              'https://hakimhub-backend.onrender.com/api/user/verify-email'),
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
          body: jsonEncode({'email': email, 'code': otp}))).called(1);
    });
  });
}
