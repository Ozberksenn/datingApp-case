import 'package:datingapp/features/view/login/login_view.dart';
import 'package:datingapp/features/view/register/register_view.dart';
import 'package:go_router/go_router.dart';

import 'app_routes.dart';

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.path(AppRoutes.register),
  routes: <RouteBase>[
    GoRoute(
      path: AppRoutes.path(AppRoutes.login),
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: AppRoutes.path(AppRoutes.register),
      builder: (context, state) => const RegisterView(),
    ),
  ],
);
