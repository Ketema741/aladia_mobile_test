import 'package:flutter/material.dart';

abstract class ThemeState {
  final ThemeData themeData;

  ThemeState(this.themeData);
}

class LightThemeState extends ThemeState {
  LightThemeState(super.themeData);
}

class DarkThemeState extends ThemeState {
  DarkThemeState(super.themeData);
}
