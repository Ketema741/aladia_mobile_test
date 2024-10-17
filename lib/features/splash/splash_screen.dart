// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SharedPreferences _prefs;
  bool isFirstTimeUser = false;

  @override
  void initState() {
    super.initState();
    initializePreferences();
    Timer(const Duration(seconds: 1), () {
      Future.delayed(const Duration(seconds: 3), () {
        navigateToOnboardingOrMain();
      });
    });
  }

  void initializePreferences() async {
    _prefs = await SharedPreferences.getInstance();
    isFirstTimeUser = _prefs.getBool('isFirstTimeUser') ?? true;
  }

  void navigateToOnboardingOrMain() {
    if (isFirstTimeUser) {
      context.go('/onboarding');
    } else {
      context.go('/signup');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/aladia_logo.png'),
          ],
        ),
      ),
    );
  }
}
