import 'package:dayofday/pages/home/home_screen_page.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreenPage()),
  ],
);
