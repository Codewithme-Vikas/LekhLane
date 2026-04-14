import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/feature/blog/domain/entities/blog.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class BlogRepo {
  Future<Either<Failure, Blog>> uploadBlog({
    required String authorId,
    required String title,
    required String content,
    required List<String> categories,
  });
}
