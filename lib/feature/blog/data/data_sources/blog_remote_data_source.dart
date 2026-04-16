import 'package:blog_app/core/error/exceptions.dart';
import 'package:blog_app/feature/blog/data/model/blog_model.dart';
import 'package:dio/dio.dart';

abstract interface class BlogRemoteDataSource {
  Future<BlogModel> uploadBlog(BlogModel blog);

  Future<List<BlogModel>> getAllBlogs();
}

class BlogRemoteDataSourceImpl implements BlogRemoteDataSource {
  final Dio dio;
  BlogRemoteDataSourceImpl(this.dio);

  @override
  Future<BlogModel> uploadBlog(BlogModel blog) async {
    try {
      await Future.delayed(Duration(seconds: 2));

      //final response = dio.post('blog/post',data: blog.toJson());

      //if ( response == null){
      //  throw ServerException("Blog is not uploading successfully");
      //}

      print("**********--------------------*************");
      print(blog.toJson());

      defaultBlogs.add(blog.toJson());

      final Map<String, dynamic> uploadBlog = defaultBlogs[1];

      return BlogModel.fromJson(uploadBlog);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<BlogModel>> getAllBlogs() async {
    try {
      await Future.delayed(Duration(seconds: 2));

      //final response = await dio.get("path/getAllBlog");

      final List<Map<String, dynamic>> blogsList = defaultBlogs;

      return blogsList
          .map(
            (blogJson) =>
                BlogModel.fromJson(blogJson).copyWith(authorName: "Ram Lala"),
          )
          .toList();
    } catch (e) {
      throw ServerException("Blogs could not be fetched!");
    }
  }
}

final List<Map<String, dynamic>> defaultBlogs = [
  {
    'id': '999',
    'authorId': 'Ikas Singh Prathiar Gurjar',
    'title': 'Earth : The home',
    'content':
        "Earth is the third planet from the Sun and the only astronomical object known to harbor life. This is made possible by Earth being an ocean world, the only one in the Solar System sustaining liquid surface water. Almost all of Earth's water is contained in its global ocean, covering 70.8% of Earth's crust. The remaining 29.2% of Earth's crust is land, most of which is located in the form of continental landmasses within Earth's land hemisphere. Most of Earth's land is at least somewhat humid and covered by vegetation, while large ice sheets at Earth's polar deserts retain more water than Earth's groundwater, lakes, rivers, and atmospheric water combined. Earth's crust consists of slowly moving tectonic plates, which interact to produce mountain ranges, volcanoes, and earthquakes. Earth has a liquid outer core that generates a magnetosphere capable of deflecting most of the destructive solar winds and cosmic radiation."
        "Earth has a dynamic atmosphere, which sustains Earth's surface conditions and protects it from most meteoroids and UV-light at entry. It is composed primarily of nitrogen and oxygen. Water vapor is widely present in the atmosphere, forming clouds that cover most of the planet. The water vapor acts as a greenhouse gas and, together with other greenhouse gases in the atmosphere, particularly carbon dioxide (CO2), creates the conditions for both liquid surface water and water vapor to persist via the capturing of energy from the Sun's light. This process maintains the current average surface temperature of 14.76 °C (58.57 °F), at which water is liquid under normal atmospheric pressure. Differences in the amount of captured energy between geographic regions (as with the equatorial region receiving more sunlight than the polar regions) drive atmospheric and ocean currents, producing a global climate system with different climate regions, and a range of weather phenomena such as precipitation, allowing components such as carbon and nitrogen to cycle."
        "Earth is rounded into an ellipsoid with a circumference of about 40,000 kilometers (24,900 miles). It is the densest planet in the Solar System. Of the four rocky planets, it is the largest and most massive. Earth is about eight light-minutes (1 AU) away from the Sun and orbits it, taking a year (about 365.25 days) to complete one revolution. Earth rotates around its own axis in slightly less than a day (in about 23 hours and 56 minutes). Earth's axis of rotation is tilted with respect to the perpendicular to its orbital plane around the Sun, producing seasons. Earth is orbited by one permanent natural satellite, the Moon, which orbits Earth at 384,400 km (238,855 mi)—1.28 light seconds—and is roughly a quarter as wide as Earth. The Moon's gravity helps stabilize Earth's axis, causes tides and gradually slows Earth's rotation. Likewise, Earth's gravitational pull has already made the Moon's rotation tidally locked, keeping the same near side facing Earth."
        "Earth, like most other bodies in the Solar System, formed about 4.5 billion years ago from gas and dust in the early Solar System. The formation of the ocean and the subsequent development of life occurred during the first billion years of Earth's history. Life spread globally and has been altering Earth's atmosphere and surface, leading to the Great Oxidation Event two billion years ago. Humans emerged 300,000 years ago in Africa and have spread across every continent on Earth. Humans depend on Earth's biosphere and natural resources for their survival, but have increasingly impacted the planet's environment. Humanity's current impact on Earth's climate and biosphere is unsustainable, threatening the livelihood of humans and many other forms of life, and causing widespread extinctions.",
    'updatedAt': DateTime(2024, 11, 5).toIso8601String(),
    'categories': ['flutter', 'state-management'],
    'image': null,
  },
  {
    'id': '1',
    'authorId': 'author_001',
    'title': 'Mastering Flutter State Management in 2024',
    'content':
        'State management is one of the most debated topics in Flutter development. '
        'With so many options available — BLoC, Riverpod, Provider, GetX — choosing '
        'the right solution can feel overwhelming. In this article, we break down each '
        'approach with real-world use cases, performance benchmarks, and code examples '
        'to help you make an informed decision for your next project.',
    'updatedAt': DateTime(2024, 11, 5).toIso8601String(),
    'categories': ['flutter', 'state-management'],
    'image': null,
  },
  {
    'id': '2',
    'authorId': 'author_002',
    'title': 'Clean Architecture in Flutter: A Practical Guide',
    'content':
        'Clean Architecture separates your code into layers — presentation, domain, '
        'and data — making it testable, scalable, and maintainable. This guide walks '
        'you through structuring a Flutter app from scratch using Clean Architecture '
        'principles, with dependency injection via GetIt and use cases that keep your '
        'business logic completely independent of Flutter itself.',
    'updatedAt': DateTime(2024, 10, 18).toIso8601String(),
    'categories': ['flutter', 'architecture', 'clean-code'],
    'image': null,
  },
  {
    'id': '3',
    'authorId': 'author_003',
    'title': 'Why Rust is the Future of System Programming',
    'content':
        'Rust has been Stack Overflow\'s most loved language for 8 consecutive years — '
        'and for good reason. Memory safety without a garbage collector, fearless '
        'concurrency, and blazing-fast performance make Rust a compelling choice for '
        'system-level programming. We explore how Rust\'s ownership model eliminates '
        'entire classes of bugs at compile time and why major companies like Microsoft '
        'and Google are betting on it.',
    'updatedAt': DateTime(2024, 9, 30).toIso8601String(),
    'categories': ['rust', 'systems-programming', 'tech'],
    'image': null,
  },
  {
    'id': '4',
    'authorId': 'author_004',
    'title': 'Supabase vs Firebase: Which Backend Should You Choose?',
    'content':
        'Firebase has long been the go-to backend for mobile developers, but Supabase '
        'is rapidly emerging as a powerful open-source alternative. In this deep dive, '
        'we compare authentication, real-time database, storage, pricing, and developer '
        'experience across both platforms. Whether you\'re building a startup MVP or '
        'scaling to millions of users, we help you pick the right backend for your needs.',
    'updatedAt': DateTime(2024, 11, 1).toIso8601String(),
    'categories': ['backend', 'firebase', 'supabase', 'tech'],
    'image': null,
  },
  {
    'id': '5',
    'authorId': 'author_005',
    'title': 'Understanding Dart Isolates for Heavy Computation',
    'content':
        'Dart is single-threaded, but that doesn\'t mean you\'re stuck with janky UIs '
        'during heavy computation. Isolates are Dart\'s answer to true parallelism — '
        'separate memory heaps running concurrently without shared state. This article '
        'covers when to use isolates, how to communicate between them using SendPort '
        'and ReceivePort, and practical examples like JSON parsing and image processing '
        'off the main thread.',
    'updatedAt': DateTime(2024, 10, 22).toIso8601String(),
    'categories': ['dart', 'flutter', 'performance'],
    'image': null,
  },
  {
    'id': '6',
    'authorId': 'author_006',
    'title': 'Designing Pixel-Perfect UIs with Flutter',
    'content':
        'Flutter gives you full control over every pixel on the screen, but with great '
        'power comes great responsibility. This article covers design principles, custom '
        'painters, responsive layouts, adaptive design for multiple screen sizes, and '
        'how to bridge the gap between Figma designs and production Flutter code. '
        'Learn how to build UIs that look stunning on every device.',
    'updatedAt': DateTime(2024, 11, 10).toIso8601String(),
    'categories': ['flutter', 'ui-design', 'frontend'],
    'image': null,
  },
];
