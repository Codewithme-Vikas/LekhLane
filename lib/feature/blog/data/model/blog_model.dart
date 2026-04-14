import 'package:blog_app/feature/blog/domain/entities/blog.dart';

class BlogModel extends Blog {
  BlogModel({
    required super.id,
    required super.authorId,
    required super.title,
    required super.content,
    required super.updatedAt,
    required super.categories,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'authorId': authorId,
      'title': title,
      'content': content,
      'updatedAt': updatedAt.toIso8601String(),
      'categories': categories,
      'image': image,
    };
  }

  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
      id: json['id'] as String,
      authorId: json['authorId'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      updatedAt: json['updatedAt'] == null
          ? DateTime.now()
          : DateTime.parse(json['updatedAt']),
      categories: List<String>.from(json['categories'] ?? json['categories']),
    );
  }

  BlogModel copyWith({
    String? id,
    String? authorId,
    String? title,
    String? content,
    List<String>? categories,
    DateTime? updatedAt,
  }) {
    return BlogModel(
      id: id ?? this.id,
      authorId: authorId ?? this.authorId,
      title: title ?? this.title,
      content: content ?? this.content,
      updatedAt: updatedAt ?? this.updatedAt,
      categories: categories ?? this.categories,
    );
  }
}
// Also can define ctor like this
/*
BlogModel(
    String id,
    String authorId,
    String title,
    String content,
    DateTime updatedAt,
    File image,
    List<String> categories,
  ) : super(
        authorId: authorId,
        title: title,
        id: id,
        content: content,
        updatedAt: updatedAt,
        image: image,
        categories: categories,
      );
*/