import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:blog_app/core/utils/calculate_reading_time.dart';
import 'package:blog_app/feature/blog/domain/entities/blog.dart';
import 'package:blog_app/feature/blog/presentation/pages/blog_viewer_screen.dart';
import 'package:flutter/material.dart';

class BlogCard extends StatelessWidget {
  const BlogCard({super.key, required this.blog, required this.color});

  final Blog blog;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, BlogViewerScreen.route(blog));
      },
      child: Container(
        height: 200,
        margin: const EdgeInsets.all(16).copyWith(bottom: 4),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 6,
                    children: blog.categories.map((category) {
                      return Chip(
                        label: Text(
                          category,
                          style: TextStyle(color: AppPallete.textPrimary),
                        ),
                        side: null,
                        color: WidgetStateProperty.all(AppPallete.tagText),
                      );
                    }).toList(),
                  ),
                ),
                Text(
                  blog.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Text('${calculateReadingTime(blog.content)} min'),
          ],
        ),
      ),
    );
  }
}
