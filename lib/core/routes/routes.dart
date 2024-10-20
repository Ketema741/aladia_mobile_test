import 'package:aladia_flutter_test/core/constants/route_constants.dart';
import 'package:aladia_flutter_test/features/home/home.dart';
import 'package:aladia_flutter_test/features/onboarding/onboarding_screen.dart';
import 'package:aladia_flutter_test/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/authentication/presentation/screens/pages.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final GoRouter router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: <RouteBase>[
   GoRoute(
      path: '/',
      name: RouteConstants.spalashRouteName,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
   GoRoute(
      path: '/home',
      name: RouteConstants.homeScreenRouteName,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
   GoRoute(
      path: '/onboarding',
      name: RouteConstants.onBoardingRouteName,
      builder: (BuildContext context, GoRouterState state) {
        return const OnboardingScreen();
      },
    ),

    GoRoute(
        path: '/signup',
        name: RouteConstants.signUpRouteName,
        builder: (BuildContext context, GoRouterState state) {
          return const SignUpScreen();
        }),

    GoRoute(
        path: '/login',
        name: RouteConstants.signInRouteName,
        builder: (BuildContext context, GoRouterState state) {
          return const SigninScreen();
        }),
   
  ],
);
