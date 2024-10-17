
import 'package:aladia_flutter_test/features/authentication/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required String id,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String email,
    required String password,
  }) : super(
          id: id,
          firstName: firstName,
          lastName: lastName,
          phoneNumber: phoneNumber,
          email: email,
          password: password,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'email': email,
      'password': password,
    };
  }
}
