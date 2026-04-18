import 'package:blog_app/core/constants/constant.dart';
import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;

  DioClient()
    : dio = Dio(
        BaseOptions(
          baseUrl: Constant.baseUrl,
          connectTimeout: Duration(seconds: 12),
          receiveTimeout: Duration(seconds: 13),
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
        ),
      );
}
