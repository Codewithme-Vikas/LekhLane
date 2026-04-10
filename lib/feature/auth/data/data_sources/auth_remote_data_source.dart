import 'package:blog_app/core/error/exceptions.dart';
import 'package:blog_app/feature/auth/data/models/user_model.dart';
import 'package:dio/dio.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> signUpWithUsernamePassword({
    required String username,
    required String email,
    required String password,
  });

  Future<UserModel> loginWithUsernamePassword({
    required String username,
    required String password,
  });

  Future<bool> sendOtpOnEmail({required String email});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  // inject any dependency -> by constructor [ DI concept ]
  final Dio dio;
  AuthRemoteDataSourceImpl({required this.dio});

  @override
  Future<bool> sendOtpOnEmail({required String email}) async {
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signUpWithUsernamePassword({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      print("how this works, I know a little more bit........");
      // backend call
      //final response = await dio.post(
      // 'url_path to singup call',
      // data: {'username': username, 'email': email, 'password': password},
      //);

      await Future.delayed(Duration(seconds: 2));

      print("how this works, I know a little more bit........");

      //if (response == null) {
      //  throw ServerException("User is null!");
      //}

      final Map<String, dynamic> response = {
        'id': "123",
        'username': "ikas",
        'email': "ikas@gmail.com",
      };

      return UserModel.fromJson(response);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> loginWithUsernamePassword({
    required String username,
    required String password,
  }) async {
    try {
      final Map<String, dynamic> response = {
        'id': "123",
        'username': "ikas",
        'email': "ikas@gmail.com",
      };

      await Future.delayed(Duration(seconds: 2));

      return UserModel.fromJson(response);
    } catch (e) {
      throw ServerException("Invalid Credentials");
    }
  }
}
