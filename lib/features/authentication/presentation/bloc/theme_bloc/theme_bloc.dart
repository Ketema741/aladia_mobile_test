// lib/features/theme/presentation/bloc/theme_bloc.dart

import 'package:aladia_flutter_test/core/theme/dartk_theme.dart';
import 'package:aladia_flutter_test/core/theme/light_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  bool isDarkMode = false;

  // Initialize with the light theme by default
  ThemeBloc() : super(LightThemeState(lightTheme)) {
    // Register the handler for ToggleThemeEvent
    on<ToggleThemeEvent>((event, emit) {
      // Toggle the boolean flag for dark mode
      isDarkMode = !isDarkMode;
      
      // Emit the corresponding state based on the toggle
      if (isDarkMode) {
        emit(DarkThemeState(darkTheme));
      } else {
        emit(LightThemeState(lightTheme));
      }
    });
  }
}
