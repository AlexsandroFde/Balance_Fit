import 'package:balance_fit/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'constants/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: AppColors.theme),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home,
      routes: AppRoutes.define(),
    );
  }
}