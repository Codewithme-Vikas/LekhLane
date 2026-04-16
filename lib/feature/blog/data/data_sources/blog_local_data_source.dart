import 'package:blog_app/feature/blog/data/model/blog_model.dart';
import 'package:hive/hive.dart';

abstract interface class BlogLocalDataSource {
  void uploadLocalBlogs({required List<BlogModel> blogs});

  List<BlogModel> loadAllBlogs();
}

class BlogLocalDataSourceImpl implements BlogLocalDataSource {
  final Box box;
  BlogLocalDataSourceImpl(this.box);

  @override
  void uploadLocalBlogs({required List<BlogModel> blogs}) {
    box.clear(); // Not duplicate blogs

    box.write(() {
      for (int i = 0; i < blogs.length; i++) {
        box.put(i.toString(), blogs[i].toJson());
      }
    });
  }

  @override
  List<BlogModel> loadAllBlogs() {
    final List<BlogModel> blogs = [];

    box.read(() {
      for (int i = 0; i < box.length; i++) {
        final value = box.get(i.toString());
        blogs.add(BlogModel.fromJson(value));
      }
    });

    return blogs;
  }
}
