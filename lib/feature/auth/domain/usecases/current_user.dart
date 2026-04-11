import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/core/common/entities/user.dart';
import 'package:blog_app/feature/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class CurrentUser implements UseCase<User, NoParams> {
  final AuthRepo authRepo;
  CurrentUser(this.authRepo);

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await authRepo.getCurrentUserData();
  }
}
