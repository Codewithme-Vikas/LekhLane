import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/feature/blog/domain/entities/blog.dart';
import 'package:blog_app/feature/blog/domain/repositories/blog_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetAllBlogs implements UseCase<List<Blog>, NoParams> {
  final BlogRepo blogRepo;
  GetAllBlogs(this.blogRepo);

  @override
  Future<Either<Failure, List<Blog>>> call(NoParams params) async {
    return await blogRepo.getAllBlogs();
  }
}
