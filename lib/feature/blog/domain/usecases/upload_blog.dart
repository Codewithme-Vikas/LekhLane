import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/feature/blog/domain/entities/blog.dart';
import 'package:blog_app/feature/blog/domain/repositories/blog_repository.dart';
import 'package:fpdart/fpdart.dart';

class UploadBlog implements UseCase<Blog, UploadBlogParams> {
  final BlogRepo blogRepo;
  UploadBlog(this.blogRepo);

  @override
  Future<Either<Failure, Blog>> call(UploadBlogParams params) async {
    return await blogRepo.uploadBlog(
      authorId: params.authorId,
      title: params.title,
      content: params.content,
      categories: params.categories,
    );
  }
}

class UploadBlogParams {
  final String authorId;
  final String title;
  final String content;
  final List<String> categories;

  UploadBlogParams({
    required this.authorId,
    required this.title,
    required this.content,
    required this.categories,
  });
}
