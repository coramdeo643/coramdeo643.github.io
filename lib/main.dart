import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_blog/core/app_theme.dart';
import 'package:github_blog/pages/home_page.dart';
import 'package:github_blog/pages/post_detail_page.dart';
import 'package:go_router/go_router.dart';

import 'firebase_options.dart';

final router = GoRouter(routes: [GoRoute(path: '/',
builder: (context, state) => HomePage()),
GoRoute(path: '/post/:id',
builder: (context, state) {
  final id = state.pathParameters['id'];
  return PostDetailPage(postId: id!);
})]);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
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
