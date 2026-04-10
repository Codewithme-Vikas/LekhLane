part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthSignUp extends AuthEvent {
  final String email;
  final String password;
  final String username;

  AuthSignUp({
    required this.username,
    required this.password,
    required this.email,
  });
}

final class AuthLogin extends AuthEvent {
  final String username;
  final String password;

  AuthLogin({required this.username, required this.password});
}
