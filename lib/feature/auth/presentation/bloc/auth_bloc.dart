import 'package:bloc/bloc.dart';
import 'package:blog_app/feature/auth/data/models/user_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthSignUp>(_onAuthSignUp);
  }

  void _onAuthSignUp(AuthSignUp event, Emitter emit) {
    try {
      emit(AuthLoadingState());

      // call API
      final result = true; // authRepo.sinup( p1,p2,p3,p4 );

      if (result) {
        emit(AuthSuccessState(user: UserModel(username: 'hi', email: 'h', password: 'i', userId: '123')));
      }

      emit(AuthSuccessState(user: UserModel(username: 'null', email: 'null', password: 'null', userId: 'null')));
    } catch (e) {
      emit(AuthFailureState(message: e.toString()));
    }
  }
}
