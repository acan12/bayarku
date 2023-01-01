import 'package:bayarku/ui/pages/boarding/boarding1_page.dart';
import 'package:bayarku/ui/pages/boarding/boarding3_page.dart';
import 'package:bayarku/ui/pages/error_page.dart';
import 'package:bayarku/ui/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'ui/pages/auth/login_page.dart';
import 'ui/pages/boarding/boarding2_page.dart';

const String routeMain = '/';
const String routeBoardingOne = 'boarding1';
const String routeBoardingTwo = 'boarding2';
const String routeBoardingThree = 'boarding3';
const String routeLogin = '/login';
const String routeSplash = 'splash';

final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: routeMain,
    routes: [
      GoRoute(
          path: routeMain,
          pageBuilder: (context, state) =>
              MaterialPage(key: state.pageKey, child: const SplashPage()),
          routes: [
            GoRoute(
                path: routeBoardingOne,
                pageBuilder: (context, state) =>
                    buildPageWithDefaultTransition<void>(
                        context: context,
                        state: state,
                        child: const Boarding1Page())),
            GoRoute(
                path: routeBoardingTwo,
                pageBuilder: (context, state) =>
                    buildPageWithSlideTransition<void>(
                        context: context,
                        state: state,
                        child: const Boarding2Page())),
            GoRoute(
                path: routeBoardingThree,
                pageBuilder: (context, state) =>
                    buildPageWithSlideTransition<void>(
                        context: context,
                        state: state,
                        child: const Boarding3Page())),
          ]),
      GoRoute(
          path: routeLogin,
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
              context: context, state: state, child: const LoginPage())),
    ],
    errorPageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: ErrorPage(exception: state.error),
        ));

CustomTransitionPage buildPageWithSlideTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        SlideTransition(
            position: animation.drive(
              Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).chain(CurveTween(curve: Curves.easeIn)),
            ),
            child: child),
  );
}

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(
            opacity: animation,
            child: child,
          ));
}
