import 'package:blog_app/feature/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepo {

  @override
  Future<void> sendOTP(String email) async {

    try {
      
      // http call to backend

      
    } catch (e) {
      Exception("not able to send email");
    }
  }

  @override
  Future<void> login(String username, String password) async {}

  @override
  Future<void> signUp(String username, String email, String password) async {}

  @override
  Future<void> verifyOTP(String otp) async {}


}