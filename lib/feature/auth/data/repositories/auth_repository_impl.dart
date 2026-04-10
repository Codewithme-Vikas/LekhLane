import 'package:blog_app/core/error/exceptions.dart';
import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/feature/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:blog_app/feature/auth/domain/entities/user.dart';
import 'package:blog_app/feature/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource remoteDataSource;
  AuthRepoImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, User>> signUpWithUsernamePassword({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
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
