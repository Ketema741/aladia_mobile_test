import 'package:aladia_flutter_test/core/error/failures.dart';
import 'package:aladia_flutter_test/core/usecases/usecase.dart';
import 'package:aladia_flutter_test/features/authentication/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SigninUserUsecase implements UseCase<String, LoginParams> {
  final AuthRepository repository;

  SigninUserUsecase(this.repository);

  @override
  Future<Either<Failure, String>> call(LoginParams params) async {
    final result = await repository.signin(params.email, params.password);
    return result;
  }
}

class LoginParams extends Equatable {
  final String email;
  final String password;
  const LoginParams({required this.email, required this.password});

  @override
  List<Object?> get props => ([email, password]);
}
