import 'dart:math';

import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:blog_app/core/utils/calculate_reading_time.dart';
import 'package:blog_app/core/utils/format_date.dart';
import 'package:blog_app/feature/blog/domain/entities/blog.dart';
import 'package:flutter/material.dart';

class BlogViewerScreen extends StatelessWidget {
  static route(Blog blog) =>
      MaterialPageRoute(builder: (context) => BlogViewerScreen(blog: blog));

  const BlogViewerScreen({super.key, required this.blog});

  final Blog blog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                Text(
                  blog.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),

                Text(
                  'By ${blog.authorName}',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),

                Text(
                  "${formateDateBydMMMYYYY(blog.updatedAt)}  . ${calculateReadingTime(blog.content)} min",
                  style: TextStyle(
                    color: AppPallete.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 4),

                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(10),
                  child: Image.network(
                    "https://cdn.pixabay.com/photo/2015/04/19/08/32/flower-729510_1280.jpg",
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.broken_image_rounded, size: 40);
                    },
                  ),
                ),

                Text(blog.content, style: TextStyle(fontSize: 14, height: 1.8)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
