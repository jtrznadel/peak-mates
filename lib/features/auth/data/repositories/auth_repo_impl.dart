import 'package:dartz/dartz.dart';
import 'package:peak_mates/core/errors/exceptions.dart';
import 'package:peak_mates/core/errors/failures.dart';
import 'package:peak_mates/core/utilities/typedefs.dart';
import 'package:peak_mates/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:peak_mates/features/auth/domain/entities/user.dart';
import 'package:peak_mates/features/auth/domain/repositories/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl(this._remoteDataSource);

  final AuthRemoteDataSource _remoteDataSource;

  @override
  ResultFuture<User> signIn(
      {required String email, required String password}) async {
    try {
      final result =
          await _remoteDataSource.signIn(email: email, password: password);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<void> signUp({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      await _remoteDataSource.signUp(
        email: email,
        password: password,
        username: username,
      );
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }
}
