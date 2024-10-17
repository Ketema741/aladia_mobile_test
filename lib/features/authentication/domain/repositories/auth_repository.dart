import 'package:aladia_flutter_test/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> signup(
    String email,
    String password,
    String firstName,
    String lastName,
    String phoneNumber,
  );
  
  Future<Either<Failure, String>> signin(
    String email,
    String password,
  );

  Future<Either<Failure, String>> verifyOtp(
  {  required String email,
    required String otp,}
  );
}
