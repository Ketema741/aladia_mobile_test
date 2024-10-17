import 'dart:convert';
import 'package:aladia_flutter_test/core/error/exception.dart';
import 'package:aladia_flutter_test/core/utils/constants.dart';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSource {
  Future<String> signin(String email, String password);
  Future<void> signup(String email, String password, String firstName,
      String lastName, String phoneNumber);
  Future<String> verifyOtp({required String email, required String otp});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSourceImpl({required this.client});
  @override
  Future<String> signin(String email, String password) async {
    final url = Uri.parse('$kBaseUrl/auth/login');

     // Request body
    final body = jsonEncode({
      'email': email,
      'password': password,
    });

    final response = await client.post(
      url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: body,
    );
    if (response.statusCode == 200 || jsonDecode(response.body)["accessToken"].toString().isNotEmpty) {
      return jsonDecode(response.body)["accessToken"].toString();
    } else {
      throw ServerException(message: jsonDecode(response.body)['message']);
    }
  }

  @override
  Future<void> signup(String email, String password, String firstName,
      String lastName, String phoneNumber) async {
    final response = await client.post(
      Uri.parse('$kBaseUrl/auth/register'),
      body: {
        'email': email,
        'password': password,
        'firstName': firstName,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
      },
    );
    if (response.statusCode == 200) {
    } else {
      throw ServerException(message: jsonDecode(response.body)['message']);
    }
  }

  @override
  Future<String> verifyOtp({required String email, required String otp}) async {
    final response = await client.post(
      Uri.parse('$kBaseUrl/auth/verify-email'),
      body: jsonEncode({
        'email': email,
        'code': otp,
      }),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['message'];
    } else {
      throw ServerException(message: jsonDecode(response.body)["message"]);
    }
  }
}
