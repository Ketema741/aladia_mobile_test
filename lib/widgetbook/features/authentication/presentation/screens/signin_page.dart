import 'package:aladia_flutter_test/features/authentication/presentation/bloc/login_bloc.dart';
import 'package:aladia_flutter_test/features/authentication/presentation/screens/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:aladia_flutter_test/generated/l10n.dart';

// Mock Classes
class MockLoginBloc extends Mock implements LoginBloc {}

class FakeLoginEvent extends Fake implements LoginEvent {}

class FakeLoginState extends Fake implements LoginState {}

// Register Fallbacks
void registerFallbacks() {
  registerFallbackValue(FakeLoginEvent());
  registerFallbackValue(FakeLoginState());
}

@widgetbook.UseCase(name: 'SigninScreen - Initial', type: SigninScreen)
Widget signinScreenInitialUseCase(BuildContext context) {
  registerFallbacks();

  final mockLoginBloc = MockLoginBloc();

  // Mock the state getter
  when(() => mockLoginBloc.state).thenReturn(LoginInitialState());

  // Mock the stream getter
  when(() => mockLoginBloc.stream)
      .thenAnswer((_) => const Stream<LoginState>.empty());

  // Mock the add method
  when(() => mockLoginBloc.add(any())).thenReturn(null);

  return MaterialApp(
    localizationsDelegates: const [
      S.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: S.delegate.supportedLocales,
    home: BlocProvider<LoginBloc>(
      create: (_) => mockLoginBloc,
      child: const SigninScreen(),
    ),
  );
}

// Repeat similar changes for other use cases

@widgetbook.UseCase(name: 'SigninScreen - Loading', type: SigninScreen)
Widget signinScreenLoadingUseCase(BuildContext context) {
  registerFallbacks();

  final mockLoginBloc = MockLoginBloc();

  when(() => mockLoginBloc.state).thenReturn(LoginLoadingState());

  when(() => mockLoginBloc.stream)
      .thenAnswer((_) => Stream.value(LoginLoadingState()));

  when(() => mockLoginBloc.add(any())).thenReturn(null);

  return MaterialApp(
    localizationsDelegates: const [
      S.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: S.delegate.supportedLocales,
    home: BlocProvider<LoginBloc>(
      create: (_) => mockLoginBloc,
      child: const SigninScreen(),
    ),
  );
}

@widgetbook.UseCase(name: 'SigninScreen - Success', type: SigninScreen)
Widget signinScreenSuccessUseCase(BuildContext context) {
  registerFallbacks();

  final mockLoginBloc = MockLoginBloc();

  when(() => mockLoginBloc.state).thenReturn(LoginSuccessState(token: ''));

  when(() => mockLoginBloc.stream)
      .thenAnswer((_) => Stream.value(LoginSuccessState(token: '')));

  when(() => mockLoginBloc.add(any())).thenReturn(null);

  return MaterialApp(
    localizationsDelegates: const [
      S.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: S.delegate.supportedLocales,
    home: BlocProvider<LoginBloc>(
      create: (_) => mockLoginBloc,
      child: const SigninScreen(),
    ),
  );
}

@widgetbook.UseCase(name: 'SigninScreen - Failure', type: SigninScreen)
Widget signinScreenFailureUseCase(BuildContext context) {
  registerFallbacks();

  final mockLoginBloc = MockLoginBloc();

  when(() => mockLoginBloc.state)
      .thenReturn(LoginFailureState(error: 'Invalid credentials'));

  when(() => mockLoginBloc.stream).thenAnswer(
    (_) => Stream.value(
      LoginFailureState(error: 'Invalid credentials'),
    ),
  );

  when(() => mockLoginBloc.add(any())).thenReturn(null);

  return MaterialApp(
    localizationsDelegates: const [
      S.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: S.delegate.supportedLocales,
    home: BlocProvider<LoginBloc>(
      create: (_) => mockLoginBloc,
      child: const SigninScreen(),
    ),
  );
}
