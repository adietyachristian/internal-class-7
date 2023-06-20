import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:internal_class_7/pages/article_page.dart';
import 'package:internal_class_7/pages/home_page.dart';
import 'package:internal_class_7/pages/main_page.dart';
import 'package:internal_class_7/pages/profile_page.dart';
import 'package:internal_class_7/pages/second_page.dart';
import 'package:internal_class_7/widgets/my_navigation_bar.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MainPage(),
    ),
    GoRoute(
      path: '/second',
      builder: (context, state) => const SecondPage(),
    ),
    ShellRoute(
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: '/article',
          builder: (context, state) => const ArticlePage(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfilePage(),
        ),
      ],
      builder: (context, state, child) => MyNavigationBar(
        child: child,
      ),
    )
  ],
);

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Internal Class 7',
      theme: ThemeData.dark(useMaterial3: true),
      routerConfig: router,
    );
  }
}
