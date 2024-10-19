import 'package:aladia_flutter_test/core/theme/light_theme.dart';
import 'package:aladia_flutter_test/features/authentication/presentation/bloc/theme_bloc/theme_bloc.dart';
import 'package:aladia_flutter_test/features/authentication/presentation/bloc/theme_bloc/theme_event.dart';
import 'package:aladia_flutter_test/features/authentication/presentation/bloc/theme_bloc/theme_state.dart';
import 'package:aladia_flutter_test/features/onboarding/onboarding_screen.dart';
import 'package:aladia_flutter_test/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Mock Classes
class MockThemeBloc extends Mock implements ThemeBloc {}

class FakeThemeEvent extends Fake implements ThemeEvent {}

class FakeThemeState extends Fake implements ThemeState {}

// Register Fallbacks
void registerFallbacks() {
  registerFallbackValue(FakeThemeEvent());
  registerFallbackValue(FakeThemeState());
}

// Create a concrete implementation of ThemeState for testing
class TestThemeState extends ThemeState {
  TestThemeState({required ThemeData themeData}) : super(themeData);
}

@widgetbook.UseCase(name: 'OnboardingScreen', type: OnboardingScreen)
Widget onboardingScreenUseCase(BuildContext context) {
  registerFallbacks();

  final mockThemeBloc = MockThemeBloc();

  // Mock the state getter
  when(() => mockThemeBloc.state)
      .thenReturn(TestThemeState(themeData: lightTheme));

  // Mock the stream getter
  when(() => mockThemeBloc.stream).thenAnswer(
    (_) => Stream<ThemeState>.fromIterable([
      TestThemeState(themeData: lightTheme),
    ]),
  );

  // Mock the add method
  when(() => mockThemeBloc.add(any())).thenReturn(null);

  return MaterialApp(
    // Provide localization delegates
    localizationsDelegates: const [
      S.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    // Set supported locales
    supportedLocales: S.delegate.supportedLocales,
    // Initialize ScreenUtil
    builder: (context, widget) {
      ScreenUtil.init(context, designSize: const Size(430, 932));
      return widget!;
    },
    home: BlocProvider<ThemeBloc>(
      create: (_) => mockThemeBloc,
      child: const OnboardingScreen(),
    ),
  );
}
