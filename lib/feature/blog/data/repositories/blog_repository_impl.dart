import 'dart:io';

import 'package:blog_app/core/error/exceptions.dart';
import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/feature/blog/data/data_sources/blog_remote_data_source.dart';
import 'package:blog_app/feature/blog/data/model/blog_model.dart';
import 'package:blog_app/feature/blog/domain/entities/blog.dart';
import 'package:blog_app/feature/blog/domain/repositories/blog_repository.dart';
import 'package:fpdart/fpdart.dart';

class BlogRepoImpl implements BlogRepo {
  final BlogRemoteDataSource blogRemoteDataSource;
  BlogRepoImpl(this.blogRemoteDataSource);

  @override
  Future<Either<Failure, Blog>> uploadBlog({
    required String authorId,
    required String title,
    required String content,
    required List<String> categories,
  }) async {
    try {
      BlogModel blogModel = BlogModel(
        id: 'don not send it yourself, Db create id itself',
        authorId: 'authorId',
        title: 'title',
        content: 'content',
        updatedAt: DateTime.now(),
        categories: ['categories'],
      );

      //final uploadedBlog = await blogRemoteDataSource.uploadBlog(blogModel);

      await Future.delayed(Duration(seconds: 3));

      final uploadedBlog = {
        'id': '123',
        'authorId': 'author_123',
        'title': 'earth',
        'content': 'Earth is the our home',
        'updatedAt': DateTime.now().toIso8601String(),
        'categories': ['tech', 'flutter'],
      };

      return right(BlogModel.fromJson(uploadedBlog));
      // return left(Failure("Failure : Blog is not uploaded!"));
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Blog>>> getAllBlogs() async {
    try {
      final uploadedBlog = await blogRemoteDataSource.getAllBlogs();

      return right(uploadedBlog);
      // return left(Failure("Failure : Blog is not uploaded!"));
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
