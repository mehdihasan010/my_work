import 'package:assignment_1/app/app_theme.dart';
import 'package:assignment_1/ui/screens/main_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter ui',
      theme: AppTheme.darkThemeMode,
      home: MainScreen(),
    );
  }
}
