import 'package:aladia_flutter_test/core/error/failures.dart';
import 'package:aladia_flutter_test/core/utils/typedef.dart';
import 'package:dartz/dartz.dart';


abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class UseCaseWithParams<Type, Params> {
  const UseCaseWithParams();
  ResultFuture<Type> call(Params params);
}

abstract class UseCaseWithoutParams<Type> {
  const UseCaseWithoutParams();
  ResultFuture<Type> call();
}