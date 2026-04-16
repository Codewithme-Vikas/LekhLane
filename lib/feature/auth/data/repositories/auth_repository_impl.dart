import 'package:blog_app/core/error/exceptions.dart';
import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/core/network/connection_checker.dart';
import 'package:blog_app/feature/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:blog_app/core/common/entities/user.dart';
import 'package:blog_app/feature/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource remoteDataSource;
  final ConnectionChecker connectionChecker;

  AuthRepoImpl({
    required this.remoteDataSource,
    required this.connectionChecker,
  });

  @override
  Future<Either<Failure, User>> getCurrentUserData() async {
    try {
      if (!await connectionChecker.isConnected) {
        return left(Failure("No Internet Connection"));
      }
      final User? user = await remoteDataSource.getCurrentUserData();

      if (user == null) {
        return left(Failure("User is not logged In!"));
      }

      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> signUpWithUsernamePassword({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      if (!await connectionChecker.isConnected) {
        return left(Failure("No Internet Connection"));
      }

      final user = await remoteDataSource.signUpWithUsernamePassword(
        username: username,
        email: email,
        password: password,
      );

      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> loginWithUsernamePassword({
    required String username,
    required String password,
  }) async {
    try {
      if (!await connectionChecker.isConnected) {
        return left(Failure("No Internet Connection"));
      }
      final user = await remoteDataSource.loginWithUsernamePassword(
        username: username,
        password: password,
      );

      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> verfiyOTP({
    required String username,
    required String otp,
  }) async {
    try {
      if (!await connectionChecker.isConnected) {
        return left(Failure("No Internet Connection"));
      }
      final user = await remoteDataSource.signUpWithUsernamePassword(
        username: username,
        password: '123',
        email: 'lala',
      );

      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> sendOtpOnEmail({required String email}) async {
    try {
      final user = await remoteDataSource.signUpWithUsernamePassword(
        username: 'how',
        email: email,
        password: 'noman',
      );

      return right(true);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
