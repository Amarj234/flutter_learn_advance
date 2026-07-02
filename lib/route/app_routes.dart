import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_more/route/page_not_found.dart';

// 📍 Route Constants
class RouteConstants {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String settings = '/settings';
  static const String details = '/details/:id';
}

// 🔑 Navigator Keys
final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

// 🎯 GoRouter Provider
final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: RouteConstants.splash,
    debugLogDiagnostics: true,
    routes: [
      // 📄 Auth Routes (No Bottom Nav)
      // GoRoute(
      //   path: RouteConstants.splash,
      //   builder: (context, state) => const SplashScreen(),
      // ),
      //
      // GoRoute(
      //   path: RouteConstants.login,
      //   builder: (context, state) => const LoginScreen(),
      // ),
      //
      // // 🏠 Main App with Bottom Navigation
      // StatefulShellRoute.indexedStack(
      //   builder: (context, state, navigationShell) {
      //     return MainScreen(navigationShell: navigationShell);
      //   },
      //   branches: [
      //     // Branch 0 - Home
      //     StatefulShellBranch(
      //       routes: [
      //         GoRoute(
      //           path: RouteConstants.home,
      //           builder: (context, state) => const HomeScreen(),
      //         ),
      //       ],
      //     ),
      //
      //     // Branch 1 - Profile
      //     StatefulShellBranch(
      //       routes: [
      //         GoRoute(
      //           path: RouteConstants.profile,
      //           builder: (context, state) => const ProfileScreen(),
      //         ),
      //       ],
      //     ),
      //
      //     // Branch 2 - Settings
      //     StatefulShellBranch(
      //       routes: [
      //         GoRoute(
      //           path: RouteConstants.settings,
      //           builder: (context, state) => const SettingsScreen(),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
      //
      // // 📄 Detail Screen (Nested inside Home)
      // GoRoute(
      //   path: RouteConstants.details,
      //   parentNavigatorKey: rootNavigatorKey, // Opens as full screen
      //   builder: (context, state) {
      //     final id = state.pathParameters['id'] ?? '';
      //     return DetailsScreen(id: id);
      //   },
      // ),
    ],
    errorBuilder: (context, state) => PageNotFoundScreen(),
  );
});
