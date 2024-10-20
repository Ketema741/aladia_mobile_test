import 'package:flutter/material.dart';
import 'thema_data.dart';

class AppTheme extends InheritedWidget {
  final AppThemeData data;

  const AppTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  static AppThemeData of(BuildContext context) {
    final AppTheme? appTheme = context.dependOnInheritedWidgetOfExactType<AppTheme>();
    assert(appTheme != null, 'No AppTheme found in context');
    return appTheme!.data;
  }

  @override
  bool updateShouldNotify(AppTheme oldWidget) {
    return data != oldWidget.data;
  }
}