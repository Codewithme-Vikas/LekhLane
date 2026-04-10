import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/feature/auth/domain/entities/user.dart';
import 'package:blog_app/feature/auth/domain/repository/auth_repository.dart';

class UserLogin implements UseCase<User, LoginParams> {
  final AuthRepo authRepo;
  UserLogin(this.authRepo);

  @override
  call(LoginParams params) async {
    return await authRepo.loginWithUsernamePassword(
      username: params.username,
      password: params.password,
    );
  }
}

class LoginParams {
  final String username;
  final String password;

  LoginParams({required this.username, required this.password});
}
