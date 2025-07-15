import 'package:datingapp/product/router/app_router.dart';
import 'package:flutter/material.dart';

import 'product/storage/storage_service.dart';
import 'product/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefManager.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Dating App',
      theme: AppTheme.darkTheme,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
