import 'package:blog_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:blog_app/core/network/connection_checker.dart';
import 'package:blog_app/feature/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:blog_app/feature/auth/data/repositories/auth_repository_impl.dart';
import 'package:blog_app/feature/auth/domain/repository/auth_repository.dart';
import 'package:blog_app/feature/auth/domain/usecases/current_user.dart';
import 'package:blog_app/feature/auth/domain/usecases/user_login.dart';
import 'package:blog_app/feature/auth/domain/usecases/user_sign_up.dart';
import 'package:blog_app/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:blog_app/feature/blog/data/data_sources/blog_remote_data_source.dart';
import 'package:blog_app/feature/blog/data/repositories/blog_repository_impl.dart';
import 'package:blog_app/feature/blog/domain/repositories/blog_repository.dart';
import 'package:blog_app/feature/blog/domain/usecases/get_all_blogs.dart';
import 'package:blog_app/feature/blog/domain/usecases/upload_blog.dart';
import 'package:blog_app/feature/blog/presentation/bloc/blog_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();

  final Dio dio = Dio();
  // core
  serviceLocator.registerLazySingleton(() => dio);

  serviceLocator
    ..registerFactory(() => InternetConnection())
    ..registerFactory<ConnectionChecker>(
      () => ConnectionCheckerImpl(serviceLocator()),
    );

  _initBlog();
}

void _initAuth() {
  serviceLocator
    // DataSource
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(dio: serviceLocator<Dio>()),
    )
    // Repository
    ..registerFactory<AuthRepo>(
      () => AuthRepoImpl(
        remoteDataSource: serviceLocator<AuthRemoteDataSource>(),
        connectionChecker: serviceLocator<ConnectionChecker>(),
      ),
    )
    // UseCases
    ..registerFactory(() => UserSignUp(authRepo: serviceLocator<AuthRepo>()))
    ..registerFactory(() => UserLogin(serviceLocator<AuthRepo>()))
    ..registerFactory(() => CurrentUser(serviceLocator<AuthRepo>()));

  // We can also do this.
  // Bloc
  serviceLocator.registerLazySingleton(
    // Singleton -> persistent state
    () => AuthBloc(
      userSignUp: serviceLocator(),
      userLogin: serviceLocator(),
      currentUser: serviceLocator<CurrentUser>(),
      appUserCubit: serviceLocator(),
    ), // auto detect which need to pass -> serviceLocator<UserSignUP>
  );

  serviceLocator.registerLazySingleton<AppUserCubit>(() => AppUserCubit());
}

void _initBlog() {
  serviceLocator
    // DataSource
    ..registerFactory<BlogRemoteDataSource>(
      () => BlogRemoteDataSourceImpl(serviceLocator<Dio>()),
    )
    // Repository
    ..registerFactory<BlogRepo>(
      () => BlogRepoImpl(serviceLocator<BlogRemoteDataSource>()),
    )
    // UseCases
    ..registerFactory(() => UploadBlog(serviceLocator<BlogRepo>()))
    ..registerFactory(() => GetAllBlogs(serviceLocator<BlogRepo>()));

  serviceLocator.registerLazySingleton(
    // Singleton -> persistent state
    () => BlogBloc(
      uploadBlog: serviceLocator(),
      getAllBlogs: serviceLocator(),
    ), // auto detect which need to pass -> serviceLocator<UserSignUp>
  );
}
