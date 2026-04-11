import 'package:blog_app/core/common/entities/user.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';

abstract interface class AuthRepo {
  Future<Either<Failure, User>> signUpWithUsernamePassword({
    required String username,
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> loginWithUsernamePassword({
    required String username,
    required String password,
  });

  // actually after singup click -> send OTP to user ( hold state ) -> hit singup call -> if otp verifed create user, otherwise tell user ( backend )
  Future<Either<Failure, User>> verfiyOTP({
    required String username,
    required String otp,
  });

  Future<Either<Failure, bool>> sendOtpOnEmail({required String email});

  Future<Either<Failure, User>> getCurrentUserData();
}
