import 'package:aladia_flutter_test/features/authentication/presentation/bloc/register_bloc.dart';
import 'package:aladia_flutter_test/features/authentication/presentation/screens/signup_page.dart';
import 'package:aladia_flutter_test/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:aladia_flutter_test/generated/l10n.dart';

// Mock Classes
class MockRegisterBloc extends Mock implements RegisterBloc {}

class FakeRegisterEvent extends Fake implements RegisterEvent {}

class FakeRegisterState extends Fake implements RegisterState {}

// Register Fallbacks
void registerFallbacks() {
  registerFallbackValue(FakeRegisterEvent());
  registerFallbackValue(FakeRegisterState());
}

@widgetbook.UseCase(name: 'SignUpScreen - Initial', type: SignUpScreen)
Widget signUpScreenInitialUseCase(BuildContext context) {
  registerFallbacks();

  final mockRegisterBloc = MockRegisterBloc();

  // Mock the state getter
  when(() => mockRegisterBloc.state).thenReturn(RegisterInitialState());

  // Mock the stream getter
  when(() => mockRegisterBloc.stream)
      .thenAnswer((_) => Stream<RegisterState>.empty());

  // Mock the add method
  when(() => mockRegisterBloc.add(any())).thenReturn(null);

  return MaterialApp(
    localizationsDelegates: const [
      S.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: S.delegate.supportedLocales,
    home: BlocProvider<RegisterBloc>(
      create: (_) => mockRegisterBloc,
      child: const SignUpScreen(),
    ),
  );
}

@widgetbook.UseCase(name: 'SignUpScreen - Loading', type: SignUpScreen)
Widget signUpScreenLoadingUseCase(BuildContext context) {
  registerFallbacks();

  final mockRegisterBloc = MockRegisterBloc();

  when(() => mockRegisterBloc.state).thenReturn(RegisterLoadingState());

  when(() => mockRegisterBloc.stream)
      .thenAnswer((_) => Stream.value(RegisterLoadingState()));

  when(() => mockRegisterBloc.add(any())).thenReturn(null);

  return MaterialApp(
    localizationsDelegates: const [
      S.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: S.delegate.supportedLocales,
    home: BlocProvider<RegisterBloc>(
      create: (_) => mockRegisterBloc,
      child: const SignUpScreen(),
    ),
  );
}

@widgetbook.UseCase(name: 'SignUpScreen - Success', type: SignUpScreen)
Widget signUpScreenSuccessUseCase(BuildContext context) {
  registerFallbacks();

  final mockRegisterBloc = MockRegisterBloc();

  when(() => mockRegisterBloc.state).thenReturn(RegisterSuccessState());

  when(() => mockRegisterBloc.stream)
      .thenAnswer((_) => Stream.value(RegisterSuccessState()));

  when(() => mockRegisterBloc.add(any())).thenReturn(null);

  return MaterialApp(
    localizationsDelegates: const [
      S.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: S.delegate.supportedLocales,
    home: BlocProvider<RegisterBloc>(
      create: (_) => mockRegisterBloc,
      child: const SignUpScreen(),
    ),
  );
}

@widgetbook.UseCase(name: 'SignUpScreen - Failure', type: SignUpScreen)
Widget signUpScreenFailureUseCase(BuildContext context) {
  registerFallbacks();

  final mockRegisterBloc = MockRegisterBloc();

  when(() => mockRegisterBloc.state)
      .thenReturn(RegisterFailureState(error: 'Registration failed'));

  when(() => mockRegisterBloc.stream).thenAnswer(
    (_) => Stream.value(
      RegisterFailureState(error: 'Registration failed'),
    ),
  );

  when(() => mockRegisterBloc.add(any())).thenReturn(null);

  return MaterialApp(
    localizationsDelegates: const [
      S.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: S.delegate.supportedLocales,
    home: BlocProvider<RegisterBloc>(
      create: (_) => mockRegisterBloc,
      child: const SignUpScreen(),
    ),
  );
}
