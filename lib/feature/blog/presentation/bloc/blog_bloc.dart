import 'package:bloc/bloc.dart';
import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/feature/blog/domain/entities/blog.dart';
import 'package:blog_app/feature/blog/domain/usecases/upload_blog.dart';
import 'package:flutter/material.dart';

part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final UploadBlog _uploadBlog;

  BlogBloc({required UploadBlog uploadBlog})
    : _uploadBlog = uploadBlog,
      super(BlogInitial()) {
    on<BlogEvent>((event, emit) {
      emit(BlogLoading());
    });

    on<BlogUpload>(_onBlogUpload);
  }

  void _onBlogUpload(BlogUpload event, Emitter<BlogState> emit) async {
    final response = await _uploadBlog.call(
      // if a class has call function you can directly call that _uploadBlog();
      UploadBlogParams(
        authorId: event.authorId,
        title: event.title,
        content: event.content,
        categories: event.categories,
      ),
    );

    response.fold(
      (l) => emit(BlogFailure(l.message)),
      (r) => emit(BlogSuccess(r)),
    );
  }
}
