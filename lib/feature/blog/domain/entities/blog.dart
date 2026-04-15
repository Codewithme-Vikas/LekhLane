import 'dart:io';

class Blog {
  final String id;
  final String authorId;
  final String title;
  final String content;
  File? image;
  final DateTime updatedAt;
  final List<String> categories;
  String? authorName;

  Blog({
    required this.id,
    required this.authorId,
    required this.title,
    required this.content,
    required this.updatedAt,
    required this.categories,
    this.authorName,
  });
}
