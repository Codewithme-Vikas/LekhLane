import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/core/common/entities/user.dart';
import 'package:blog_app/feature/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSignUp implements UseCase<User, UserSignUpParams> {
  final AuthRepo authRepo;
  UserSignUp({required this.authRepo});

  @override
  Future<Either<Failure, User>> call(UserSignUpParams params) async {
    return await authRepo.signUpWithUsernamePassword(
      username: params.username,
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignUpParams {
  final String email;
  final String username;
  final String password;

  UserSignUpParams({
    required this.email,
    required this.username,
    required this.password,
  });
}
