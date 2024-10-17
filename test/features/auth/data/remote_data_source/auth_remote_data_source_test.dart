import 'dart:convert';
import 'package:aladia_flutter_test/core/utils/constants.dart';
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
    // Register fallback value for URIs that are used in post calls.
    registerFallbackValue(Uri.parse('$kBaseUrl/auth/register'));
    registerFallbackValue(Uri.parse('$kBaseUrl/auth/login'));
    registerFallbackValue(Uri.parse('$kBaseUrl/auth/verify-email'));
  });

  group('signup', () {
    const email = 'test@test.com';
    const password = 'password';
    const firstName = 'John';
    const lastName = 'Doe';
    const phoneNumber = '1234567890';

    test('should perform a POST request with the correct body', () async {
      // Arrange
      when(() => mockHttpClient.post(any(), body: any(named: 'body')))
          .thenAnswer((_) async => http.Response('', 200));

      // Act
      await dataSource.signup(
          email, password, firstName, lastName, phoneNumber);

      // Assert
      verify(() => mockHttpClient.post(
            Uri.parse('$kBaseUrl/auth/register'),
            body: {
              'email': email,
              'password': password,
              'firstName': firstName,
              'lastName': lastName,
              'phoneNumber': phoneNumber,
            },
          )).called(1);
    });

  });

  group('verifyOtp', () {
    const email = 'test@example.com';
    const otp = '123456';
    const expectedMessage = 'OTP Verified Successfully';

    test('should return success message when the call is successful', () async {
      // Arrange
      when(() => mockHttpClient.post(Uri.parse('$kBaseUrl/auth/verify-email'),
              headers: {'Content-Type': 'application/json; charset=UTF-8'},
              body: jsonEncode({'email': email, 'code': otp})))
          .thenAnswer((_) async => http.Response(
                jsonEncode({'message': expectedMessage}),
                200,
              ));

      // Act
      final result = await dataSource.verifyOtp(email: email, otp: otp);

      // Assert
      expect(result, expectedMessage);
      verify(() => mockHttpClient.post(
            Uri.parse('$kBaseUrl/auth/verify-email'),
            headers: {'Content-Type': 'application/json; charset=UTF-8'},
            body: jsonEncode({'email': email, 'code': otp}),
          )).called(1);
    });

    test('should throw ServerException when the call is unsuccessful',
        () async {
      // Arrange
      const errorMessage = 'Invalid OTP';
      when(() => mockHttpClient.post(Uri.parse('$kBaseUrl/auth/verify-email'),
              headers: {'Content-Type': 'application/json; charset=UTF-8'},
              body: jsonEncode({'email': email, 'code': otp})))
          .thenAnswer((_) async => http.Response(
                jsonEncode({'message': errorMessage}),
                400,
              ));

      // Act & Assert
      expect(() async => await dataSource.verifyOtp(email: email, otp: otp),
          throwsA(isA<ServerException>()));
      verify(() => mockHttpClient.post(
            Uri.parse('$kBaseUrl/auth/verify-email'),
            headers: {'Content-Type': 'application/json; charset=UTF-8'},
            body: jsonEncode({'email': email, 'code': otp}),
          )).called(1);
    });
  });
}
