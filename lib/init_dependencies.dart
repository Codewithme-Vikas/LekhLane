import 'package:blog_app/feature/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:blog_app/feature/auth/data/repositories/auth_repository_impl.dart';
import 'package:blog_app/feature/auth/domain/repository/auth_repository.dart';
import 'package:blog_app/feature/auth/domain/usecases/user_login.dart';
import 'package:blog_app/feature/auth/domain/usecases/user_sign_up.dart';
import 'package:blog_app/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  final Dio dio = Dio();
  serviceLocator.registerLazySingleton(() => dio);
}

void _initAuth() {
  serviceLocator.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(dio: serviceLocator<Dio>()),
  );

  serviceLocator.registerFactory<AuthRepo>(
    () =>
        AuthRepoImpl(remoteDataSource: serviceLocator<AuthRemoteDataSource>()),
  );

  serviceLocator.registerFactory(
    () => UserSignUp(authRepo: serviceLocator<AuthRepo>()),
  );

  serviceLocator.registerFactory(() => UserLogin(serviceLocator<AuthRepo>()));

  serviceLocator.registerLazySingleton(
    // Singleton -> persistent state
    () => AuthBloc(
      userSignUp: serviceLocator(),
      userLogin: serviceLocator(),
    ), // auto detect which need to pass -> serviceLocator<UserSignUP>
  );
}
