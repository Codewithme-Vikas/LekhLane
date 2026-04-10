import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';

abstract interface class AuthRepo {
  Future<Either<Failure, String>> signUpWithUsernamePassword({
    required String username,
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> loginWithUsernamePassword({
    required String username,
    required String password,
  });

  // actually after singup click -> send OTP to user ( hold state ) -> hit singup call -> if otp verifed create user, otherwise tell user ( backend )
  Future<Either<Failure, String>> verfiyOTP({
    required String username,
    required String otp,
  });

  Future<Either<Failure, bool>> sendOtpOnEmail({required String email});
}
