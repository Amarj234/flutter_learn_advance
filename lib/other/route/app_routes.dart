import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:learn_more/other/route/my_app.dart'; // or the correct path where MyApp is defined


CustomTransitionPage customTransitionPage({
  required LocalKey localKey,
  required Widget pagelink,
  required Offset offset,
}) =>
    CustomTransitionPage(
      key: localKey,
      child: pagelink,
      barrierDismissible: true,
      opaque: false,
      transitionDuration: const Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          SlideTransition(
        position: animation.drive(
          Tween(
            begin: offset,
            end: Offset.zero,
          ).chain(
            CurveTween(curve: Curves.ease),
          ),
        ),
        child: child,
      ),
    );

CustomTransitionPage fadeTransitionPage({
  required LocalKey localKey,
  required Widget pagelink,
}) =>
    CustomTransitionPage(
      key: localKey,
      child: pagelink,
      fullscreenDialog: true,
      opaque: false,
      transitionDuration: const Duration(milliseconds: 200),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(
        opacity: Tween<double>(
          begin: 0,
          end: 1.0,
        ).animate(animation),
        child: child,
      ),
    );

class AppRouters {
  static final rootKey = GlobalKey<NavigatorState>();

  /* -------------------------------------------------------------------------- */
  /*                                  PAGE PATH                                 */
  /* -------------------------------------------------------------------------- */
  static const String login = 'login';
    static const String dashboard = 'dashboard';
  static const String signup = 'signup';
  static const String mkyWidget = 'my_app';
  /* -------------------------------------------------------------------------- */
  /*                               CONFIGURATIONS                               */
  /* -------------------------------------------------------------------------- */

  final GoRouter router = GoRouter(
    
    navigatorKey: rootKey,
    // observers: [GoRouteObserver()],
    initialLocation:
        '/$dashboard',
       
   // debugLogDiagnostics: AppConstants.isDebugMode,
   // errorBuilder: (context, state) => const PageNotFoundPage(),
    routes: [
  
      // GoRoute(
      //   name: mealPlanDetails,
      //   path: '/$mealPlanDetails',
      //   parentNavigatorKey: rootKey,
      //   pageBuilder: (context, state) => CustomTransitionPage<void>(
      //     key: state.pageKey,
      //     child: MealPlanDetailsPage(
      //       approveMealListREntity: state.extra as MealPlanR?,
      //     ),
      //     barrierDismissible: true,
      //     opaque: false,
      //     transitionDuration: const Duration(milliseconds: 500),
      //     transitionsBuilder: (context, animation, secondaryAnimation, child) =>
      //         SlideTransition(
      //       position: animation.drive(
      //         Tween(
      //           begin: const Offset(0, 1),
      //           end: Offset.zero,
      //         ).chain(
      //           CurveTween(curve: Curves.ease),
      //         ),
      //       ),
      //       child: child,
      //     ),
      //   ),
      // ),

      GoRoute(
        name: mkyWidget,
        path: '/$mkyWidget:id',
        parentNavigatorKey: rootKey,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>? ?? {};
             final userId = state.pathParameters['id']; //
          return MyWidget(
            message: extra['message'],
            count: extra['count']?? userId,
          );                                       
        },
      ),
   
      // GoRoute(
      //   name: scanBarcode,
      //   path: '/$scanBarcode',
      //   parentNavigatorKey: rootKey,
      //   pageBuilder: (context, state) => customTransitionPage(
      //     localKey: state.pageKey,
      //     pagelink: const ScanBarcodePage(),
      //     offset: const Offset(0, 1),
      //   ),
      // ),

      // GoRoute(
      //   name: nutritionSummary,
      //   path: '/$nutritionSummary',
      //   parentNavigatorKey: rootKey,
      //   pageBuilder: (context, state) => customTransitionPage(
      //     localKey: state.pageKey,
      //     pagelink: NutritionSummaryPage(
      //       foodsWithType: state.extra as List<Food>?,
      //       limitProtein: double.tryParse('${state.uri.queryParameters['limitProtein']}'),
      //       limitCarbohydrates: double.tryParse('${state.uri.queryParameters['limitCarbohydrates']}'),
      //       limitFat: double.tryParse('${state.uri.queryParameters['limitFat']}'),
      //     ),
      //     offset: const Offset(0, 1),
      //   ),
      // ),
    ],
  );
}



// GoRoute(
//   path: '/profile/:id',
//   name: 'profile',
//   builder: (context, state) {
//     final id = state.pathParameters['id'];
//     final tab = state.queryParameters['tab'];
//     return ProfileScreen(userId: id!, selectedTab: tab);
//   },
// )



// context.goNamed(
//   'profile',
//   params: {'id': '42'},            // for :id
//   queryParams: {'tab': 'posts'},    // ?tab=posts
// );



// context.go('/profile/42?tab=posts');



// | Method                      | Description                                                                     |
// | --------------------------- | ------------------------------------------------------------------------------- |
// | `context.push(...)`         | Like `go`, but **keeps current location on the stack** (like `Navigator.push`). |
// | `context.pushNamed(...)`    | Same as `push`, but by route `name`.                                            |
// | `context.replace(...)`      | Like `go`, but explicitly replaces current history entry.                       |
// | `context.replaceNamed(...)` | Same but by `name`.                                                             |
// | `context.pop()`             | Pops the last route off the stack (like `Navigator.pop`).                       |
