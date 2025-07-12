import 'package:datingapp/features/view/login/login_view.dart';
import 'package:go_router/go_router.dart';

import 'app_routes.dart';

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.path(AppRoutes.login),
  routes: <RouteBase>[
    GoRoute(
      path: AppRoutes.path(AppRoutes.login),
      builder: (context, state) => const LoginView(),
    ),
  ],
);
