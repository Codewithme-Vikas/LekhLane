class AuthRepo {
  Future<void> login(String username, String password) async {}

  Future<void> signUp(String username, String email, String password) async {}

  Future<void> verifyOTP(String otp) async {}

  Future<void> sendOTP(String email) async {}
}
