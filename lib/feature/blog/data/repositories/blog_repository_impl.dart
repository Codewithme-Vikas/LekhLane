import 'dart:io';

import 'package:blog_app/core/error/exceptions.dart';
import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/core/network/connection_checker.dart';
import 'package:blog_app/feature/blog/data/data_sources/blog_local_data_source.dart';
import 'package:blog_app/feature/blog/data/data_sources/blog_remote_data_source.dart';
import 'package:blog_app/feature/blog/data/model/blog_model.dart';
import 'package:blog_app/feature/blog/domain/entities/blog.dart';
import 'package:blog_app/feature/blog/domain/repositories/blog_repository.dart';
import 'package:fpdart/fpdart.dart';

class BlogRepoImpl implements BlogRepo {
  final BlogRemoteDataSource blogRemoteDataSource;
  final BlogLocalDataSource blogLocalDataSource;
  final ConnectionChecker connectionChecker;

  BlogRepoImpl({
    required this.blogRemoteDataSource,
    required this.blogLocalDataSource,
    required this.connectionChecker,
  });

  @override
  Future<Either<Failure, Blog>> uploadBlog({
    required String authorId,
    required String title,
    required String content,
    required List<String> categories,
  }) async {
    try {
      if (!await connectionChecker.isConnected) {
        return left(Failure('No internet connection'));
      }

      BlogModel blogModel = BlogModel(
        id: 'don not send it yourself, Db create id itself',
        authorId: 'authorId',
        title: 'Motive',
        content:
            '"The code that breaks you today is the architecture that defines you tomorrow." ',
        updatedAt: DateTime.now(),
        categories: ['flutter'],
      );

      final BlogModel uploadedBlog = await blogRemoteDataSource.uploadBlog(
        blogModel,
      );

      return right(uploadedBlog);
      // return left(Failure("Failure : Blog is not uploaded!"));
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Blog>>> getAllBlogs() async {
    try {
      if (!await connectionChecker.isConnected) {
        final List<BlogModel> blogs = blogLocalDataSource.loadAllBlogs();
        print("************____________******************");
        print(blogs.length);
        return right(blogs);
      }

      final List<BlogModel> blogs = await blogRemoteDataSource.getAllBlogs();

      // store blogs in local storage
      blogLocalDataSource.uploadLocalBlogs(blogs: blogs);

      return right(blogs);
      // return left(Failure("Failure : Blog is not uploaded!"));
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
