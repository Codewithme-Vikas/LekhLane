import 'package:blog_app/core/common/widgets/loader.dart';
import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:blog_app/core/utils/show_snackbar.dart';
import 'package:blog_app/feature/blog/domain/entities/blog.dart';
import 'package:blog_app/feature/blog/presentation/bloc/blog_bloc.dart';
import 'package:blog_app/feature/blog/presentation/pages/add_new_blog_screen.dart';
import 'package:blog_app/feature/blog/presentation/widgets/blog_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlogScreen extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (_) => BlogScreen());

  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  List<Blog> blogs = [];

  @override
  void initState() {
    super.initState();

    // fetch blogs
    context.read<BlogBloc>().add(BlogGetsAllBlogs());
  }

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
      body: BlocConsumer<BlogBloc, BlogState>(
        listener: (context, state) {
          if (state is BlogFailure) {
            showSnackBar(context, state.error);
          }
        },
        builder: (context, state) {
          if (state is BlogLoading) {
            return const Loader();
          }
          if (state is BlogListSuccess) {
            return ListView.builder(
              itemCount: state.blogs.length,
              itemBuilder: (context, index) {
                final blog = state.blogs[index];
                final Color color = index % 3 == 0
                    ? AppPallete.card
                    : index % 3 == 1
                    ? AppPallete.cardAlt1
                    : AppPallete.cardAlt2;
                return BlogCard(blog: blog, color: color);
              },
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
