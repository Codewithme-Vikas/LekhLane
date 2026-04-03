
part of 'auth_bloc.dart';


abstract class AuthState {
  const AuthState();
}



class AuthInitial extends AuthState{}

class AuthLoadingState extends AuthState{}


class AuthSuccessState extends AuthState{
  final UserModel user;
  AuthSuccessState({required this.user});
}



class AuthFailureState extends AuthState{
  final String message;

  AuthFailureState({required this.message});

}


