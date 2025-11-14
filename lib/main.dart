import 'package:flutter/material.dart';
import 'package:github_blog/core/app_theme.dart';
import 'package:github_blog/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: AppTheme.darkTheme,
    );
  }
}
