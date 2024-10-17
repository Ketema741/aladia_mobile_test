import 'package:aladia_flutter_test/core/error/failures.dart';
import 'package:aladia_flutter_test/features/authentication/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class VerifyOtpUseCase {
  final AuthRepository repository;

  VerifyOtpUseCase({required this.repository});

  Future<Either<Failure, String>> call(VerifyOtpParams params) async {
    return await repository.verifyOtp(
      email: params.email,
      otp: params.otp,
    );
  }
}

class VerifyOtpParams extends Equatable {
  final String otp;
  final String email;
  const VerifyOtpParams({required this.otp, required this.email});

  @override
  List<Object?> get props => ([otp, email]);
}
