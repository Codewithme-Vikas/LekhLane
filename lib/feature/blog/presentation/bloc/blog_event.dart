part of 'blog_bloc.dart';

@immutable
sealed class BlogEvent {}

final class BlogUpload extends BlogEvent {
  final String authorId;
  final String title;
  final String content;
  final List<String> categories;

  BlogUpload({
    required this.authorId,
    required this.title,
    required this.content,
    required this.categories,
  });
}
