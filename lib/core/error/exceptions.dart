class ServerException implements Exception {
  final String message;
  ServerException([this.message = "An unexpected Error"]);
}
