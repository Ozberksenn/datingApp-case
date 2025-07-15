import 'package:datingapp/product/constants/app_colors.dart';
import 'package:datingapp/product/extension/context_extension.dart';
import 'package:datingapp/product/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        context.go(AppRoutes.path(AppRoutes.login));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.black,
      width: context.dynamicWidth(1),
      height: context.dynamicHeight(1),
      child: Center(child: Image.asset("assets/logo/SinFlixLogo.png")),
    );
  }
}
