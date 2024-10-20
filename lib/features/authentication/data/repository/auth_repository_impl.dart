import 'package:aladia_flutter_test/core/error/exception.dart';
import 'package:aladia_flutter_test/core/error/failures.dart';
import 'package:aladia_flutter_test/core/network/network_info.dart';
import 'package:aladia_flutter_test/core/utils/shard_preference.dart';
import 'package:aladia_flutter_test/core/utils/typedef.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repositories/repositories.dart';
import '../data_source/data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  ResultFuture<String> signin(String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.signin(email, password);
        ShardPrefHelper.setToken(result);

        return Right(result);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      } catch (e) {
        return const Left(ServerFailure(message: 'Unexpected error occurred'));
      }
    } else {
      return const Left(ServerFailure(message: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failure, void>> signup(String email, String password,
      String firstName, String lastName, String phoneNumber) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.signup(
            email, password, firstName, lastName, phoneNumber);
        return Right(result);
      } on ServerFailure catch (e) {
        return Left(ServerFailure(message: e.message));
      } catch (e) {
        return Left(ServerFailure(message: '$e'));
      }
    } else {
      return const Left(ServerFailure(message: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failure, String>> verifyOtp(
      {required String email, required String otp}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.verifyOtp(email: email, otp: otp);
        return Right(result);
      } on ServerFailure catch (e) {
        return Left(ServerFailure(message: e.message));
      } catch (e) {
        return Left(ServerFailure(message: '$e'));
      }
    } else {
      return const Left(ServerFailure(message: 'No internet connection'));
    }
  }
}
