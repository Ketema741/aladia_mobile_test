import 'dart:convert';
import 'package:aladia_flutter_test/core/error/exception.dart';
import 'package:aladia_flutter_test/core/utils/constants.dart';
import 'package:aladia_flutter_test/core/utils/shard_preference.dart';
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
    final response = await client.post(
      Uri.parse('$kBaseUrl/auth/login'),
      body: {
        'email': email,
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      if(jsonDecode(response.body)['profileImage'] != null){
        ShardPrefHelper.setProfileImage(jsonDecode(response.body)['profileImage']);
      }
      return jsonDecode(response.body)['accessToken'];
    } else {
      throw ServerException(message: jsonDecode(response.body)['message']);
    }
  }

  @override
  Future<void> signup(String email, String password, String firstName,
      String lastName, String phoneNumber) async {
    final response = await client.post(
      Uri.parse('$kBaseUrl/user/register'),
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
      Uri.parse('$kBaseUrl/user/verify-email'),
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
