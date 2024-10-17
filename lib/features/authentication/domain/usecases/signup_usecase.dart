import 'package:aladia_flutter_test/core/error/failures.dart';
import 'package:aladia_flutter_test/core/usecases/usecase.dart';
import 'package:aladia_flutter_test/features/authentication/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';


class SignupUserUsecase implements UseCase<void, SignupParams> {
  final AuthRepository repository;

  SignupUserUsecase(this.repository);

  @override
  Future<Either<Failure, void>> call(SignupParams params) async {
    final result = await repository.signup(params.email, params.password,
        params.firstName, params.lastName, params.phoneNumber);
    return result;
  }
}

class SignupParams extends Equatable {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  const SignupParams(
      {required this.firstName,
      required this.lastName,
      required this.password,
      required this.email,
      required this.phoneNumber});

  @override
  List<Object?> get props =>
      ([email, password, firstName, lastName, phoneNumber]);
}
