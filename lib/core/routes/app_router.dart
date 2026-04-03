import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../feature/auth/presentation/pages/login_screen.dart';
import '../../feature/auth/presentation/pages/signup_screen.dart';
import '../../feature/blog/presentation/pages/post_screen.dart';
import '../../feature/profile/presentation/pages/profile_screen.dart';

import '../common/presentation/pages/home_screen.dart';
import '../common/presentation/pages/splash_screen.dart';

abstract class AppPaths {
  static final String splash = '/splash';
  static final String signup = '/signup';
  static final String login = '/login';
  static final String home = '/';
  static final String profile = '/profile';
  static final String readPost = '/post/:id';
}

class AppRouter {

  //final _authState;


  final router = GoRouter(
    initialLocation: '/',
    //refreshListenable: GoRouterRefreshStream(BlocState.stream),
    redirect: (context, state) {
      // read the auth state from BlocState

      // decide which path should be follow

      return null;
    },
    routes: [
      GoRoute(
        path: AppPaths.splash,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(path: AppPaths.login, builder: (context, state) => LoginScreen()),
      GoRoute(
        path: AppPaths.signup,
        builder: (context, state) => SignupScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) => Scaffold(
          body: child,
          //bottomNavigationBar: BottomNavigationBar(items: items),
        ),
        routes: [
          GoRoute(
            path: AppPaths.home,
            builder: (context, state) => HomeScreen(),
          ),
          GoRoute(
            path: AppPaths.profile,
            builder: (context, state) => ProfileScreen(),
          ),
          GoRoute(
            path: AppPaths.readPost,
            builder: (context, state) => PostScreen(),
          ),
        ],
      ),
    ],
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    _subscription = stream.asBroadcastStream().listen(
      (event) => notifyListeners(),
    );
  }

  late final StreamSubscription _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}