import 'package:aladia_flutter_test/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'SplashScreen', type: SplashScreen)
SplashScreen buildInactiveButtonUseCase(BuildContext context) {
  return const SplashScreen();
}

