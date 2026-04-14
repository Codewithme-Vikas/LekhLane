import 'dart:convert';

import 'package:blog_app/core/error/exceptions.dart';
import 'package:blog_app/feature/blog/data/model/blog_model.dart';
import 'package:dio/dio.dart';

abstract interface class BlogRemoteDataSource {
  Future<BlogModel> uploadBlog(BlogModel blog);
}

class BlogRemoteDataSourceImpl implements BlogRemoteDataSource {
  final Dio dio;
  BlogRemoteDataSourceImpl(this.dio);

  @override
  Future<BlogModel> uploadBlog(BlogModel blog) async {
    try {
      await Future.delayed(Duration(seconds: 2));

      //final response = dio.post('blog/post',data: blog.toJson());

      //if ( response == null){
      //  throw ServerException("Blog is not uploading successfully");
      //}

      final Map<String, dynamic> blog = {
        'id': 'id',
        'authorId': 'authorId',
        'title': 'title',
        'content': 'content',
        'updatedAt': DateTime.now().toIso8601String(),
        'categories': ['tech'],
        'image': null,
      };

      return BlogModel.fromJson(blog);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
