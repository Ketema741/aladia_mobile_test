import 'package:aladia_flutter_test/core/error/failures.dart';
import 'package:dartz/dartz.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;

typedef ResultVoid = Future<Either<Failure, void>>;

typedef DataMap = Map<String, dynamic>;

enum PageIdentifier {
  hospitalSearch,
  hospitalList,
  hospitalScreen,
  doctorScreen,
  doctorList,
  doctorSearch
}
