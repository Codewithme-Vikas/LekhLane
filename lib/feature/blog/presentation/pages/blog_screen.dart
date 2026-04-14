import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:blog_app/feature/blog/presentation/pages/add_new_blog_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlogScreen extends StatelessWidget {
  static route() => MaterialPageRoute(builder: (_) => BlogScreen());

  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, AddNewBlogScreen.route());
            },
            icon: const Icon(CupertinoIcons.add),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            Text("jaywati devi........"),
            SizedBox(height: 30),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                "SiddhIshweri Singh Prathihar-Gurjar",
                style: TextStyle(fontSize: 30, color: AppPallete.gradient1),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(onPressed: () {}, child: Text('Jiya ko maro')),
          ],
        ),
      ),
    );
  }
}
