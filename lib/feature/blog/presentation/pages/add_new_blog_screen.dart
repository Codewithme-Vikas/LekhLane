import 'dart:io';

import 'package:blog_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:blog_app/core/common/widgets/loader.dart';
import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:blog_app/core/utils/image_picker.dart';
import 'package:blog_app/core/utils/show_snackbar.dart';
import 'package:blog_app/feature/blog/presentation/bloc/blog_bloc.dart';
import 'package:blog_app/feature/blog/presentation/pages/blog_screen.dart';
import 'package:blog_app/feature/blog/presentation/widgets/blog_editor.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AddNewBlogScreen extends StatefulWidget {
  const AddNewBlogScreen({super.key});

  static route() =>
      MaterialPageRoute(builder: (context) => const AddNewBlogScreen());

  @override
  State<AddNewBlogScreen> createState() => _AddNewBlogScreenState();
}

class _AddNewBlogScreenState extends State<AddNewBlogScreen> {
  final TextEditingController _blogTitleController = TextEditingController();
  final TextEditingController _blogContentController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final List<String> categories = [
    'Engineering',
    'Technology',
    'Angular',
    'Flutter',
    'Modeling',
    'Resume',
    'Interview driven mindset',
  ];

  List<String> selectedCategories = [];

  File? blogImage;

  void handleSelectedCategories(String category) {
    setState(() {
      if (selectedCategories.contains(category)) {
        selectedCategories.remove(category);
      } else {
        selectedCategories.add(category);
      } // logic
    });
  }

  void pickImage() async {
    XFile? pickedImage = await imagePickerGallery();

    if (pickedImage != null) {
      setState(() {
        blogImage = File(pickedImage.path);
      });
    }
  }

  void _submitForm() {
    if (selectedCategories.isEmpty) {
      return showSnackBar(context, "Select at least one category");
    } else if (_formKey.currentState!.validate() &&
        selectedCategories.isNotEmpty) {
      final user = (context.read<AppUserCubit>().state as AppUserLoggedIn).user;

      context.read<BlogBloc>().add(
        BlogUpload(
          authorId: user.id,
          title: _blogTitleController.text.trim(),
          content: _blogContentController.text.trim(),
          categories: selectedCategories,
        ),
      );
    }
  }

  @override
  void dispose() {
    _blogTitleController.dispose();
    _blogContentController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BlogBloc, BlogState>(
      listener: (context, state) {
        if (state is BlogFailure) {
          showSnackBar(context, state.error);
        } else if (state is BlogSuccess) {
          Navigator.pushAndRemoveUntil(
            context,
            BlogScreen.route(),
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        if (state is BlogLoading) {
          return const Loader();
        } else {
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    _submitForm();
                  },
                  icon: const Icon(Icons.done_rounded),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      blogImage != null
                          ? GestureDetector(
                              onTap: pickImage,
                              child: ClipRRect(
                                borderRadius: BorderRadiusGeometry.circular(8),
                                child: Image.file(
                                  blogImage!,
                                  height: 180,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                pickImage();
                              },
                              child: DottedBorder(
                                options: RoundedRectDottedBorderOptions(
                                  color: AppPallete.border,
                                  dashPattern: const [10, 4],
                                  strokeCap: StrokeCap.round,
                                  radius: const Radius.circular(10),
                                ),
                                child: const SizedBox(
                                  height: 150,
                                  width: double.infinity,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.folder_open, size: 40),
                                      SizedBox(height: 15),
                                      Text(
                                        'Select your image',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                      const SizedBox(height: 20),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          spacing: 6,
                          children: categories.map((category) {
                            return GestureDetector(
                              onTap: () {
                                handleSelectedCategories(category);
                              },
                              child: Chip(
                                label: Text(
                                  category,
                                  style: TextStyle(
                                    color: selectedCategories.contains(category)
                                        ? AppPallete.textPrimary
                                        : AppPallete.tagText,
                                  ),
                                ),
                                side: selectedCategories.contains(category)
                                    ? null
                                    : BorderSide(color: AppPallete.border),
                                color: WidgetStateProperty.all(
                                  selectedCategories.contains(category)
                                      ? AppPallete.tagText
                                      : null,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),

                      const SizedBox(height: 30),

                      BlogEditor(
                        hintText: "Blog Title",
                        controller: _blogTitleController,
                      ),

                      const SizedBox(height: 15),

                      BlogEditor(
                        hintText: "Blog Content",
                        controller: _blogContentController,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
