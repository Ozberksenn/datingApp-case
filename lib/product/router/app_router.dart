import 'package:datingapp/features/view/add_photo/add_photo_view.dart';
import 'package:datingapp/features/view/home/home_view.dart';
import 'package:datingapp/features/view/login/login_view.dart';
import 'package:datingapp/features/view/register/register_view.dart';
import 'package:datingapp/features/view/splash/splash_view.dart';
import 'package:datingapp/product/storage/storage_service.dart';
import 'package:go_router/go_router.dart';
import 'app_routes.dart';

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.path(AppRoutes.splash),
  redirect: (context, state) {
    final userJson = SharedPrefManager.getUser();
    if (state.fullPath == "/splash" || state.fullPath == "/register") {
      return null;
    }
    if (userJson == null) {
      return "/login";
    } else {
      if (state.fullPath == "/login") {
        return "/home";
      } else {
        return "${state.fullPath}";
      }
    }
  },
  routes: <RouteBase>[
    GoRoute(
      path: AppRoutes.path(AppRoutes.splash),
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: AppRoutes.path(AppRoutes.login),
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: AppRoutes.path(AppRoutes.register),
      builder: (context, state) => const RegisterView(),
    ),
    GoRoute(
      path: AppRoutes.path(AppRoutes.home),
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: AppRoutes.path(AppRoutes.addPhoto),
      builder: (context, state) => AddPhotoView(),
    ),
  ],
);
