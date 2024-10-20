import 'dart:io';

import 'package:aladia_flutter_test/core/theme/light_theme.dart';
import 'package:aladia_flutter_test/features/authentication/presentation/bloc/theme_bloc/theme_bloc.dart';
import 'package:aladia_flutter_test/features/authentication/presentation/bloc/theme_bloc/theme_event.dart';
import 'package:aladia_flutter_test/features/authentication/presentation/bloc/theme_bloc/theme_state.dart';
import 'package:aladia_flutter_test/features/authentication/presentation/widgets/btn_container.dart';
import 'package:aladia_flutter_test/generated/l10n.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  ThemeMode _themeMode = ThemeMode.light;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  late TextEditingController _controller;
  String? _selectedOption = 'English';

  void _changeLanguage(String languageCode) {
    Locale locale;
    if (languageCode == 'English') {
      locale = const Locale('en', '');
    } else {
      locale = const Locale('it', '');
    }

    S.load(locale);
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double containerHeight;
    if (kIsWeb) {
      containerHeight = 700.0;
    } else if (Platform.isAndroid || Platform.isIOS) {
      containerHeight = 610.0;
    } else if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      containerHeight = 800.0;
    } else {
      containerHeight = 700.0;
    }
    List<String> options = <String>[
      'English',
      'Italiano',
    ];
    ScreenUtil.init(context, designSize: const Size(430, 932));
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 23),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        icon: const Icon(Icons.keyboard_arrow_down,
                            color: Color(0xff595959)),
                        value: _selectedOption,
                        dropdownColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(10),
                        hint: const Text(
                          'Choose language',
                          style: TextStyle(
                            color: Color(0xff595959),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Ubuntu',
                          ),
                        ),
                        items: options.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: _selectedOption == value
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                fontSize: 16,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedOption = newValue;
                            _changeLanguage(newValue!);
                          });
                        },
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        _themeMode == ThemeMode.light
                            ? Icons.dark_mode
                            : Icons.light_mode,
                      ),
                      onPressed: () {
                        BlocProvider.of<ThemeBloc>(context)
                            .add(ToggleThemeEvent());
                        setState(() {
                          _themeMode = _themeMode == ThemeMode.light
                              ? ThemeMode.dark
                              : ThemeMode.light;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: containerHeight,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: [
                      buildOnboardingPage(
                        'assets/images/aladia_logo.png',
                        S.of(context).welcome,
                        S.of(context).welcomeDescription,
                      ),
                      buildOnboardingPage(
                        'assets/images/aladia_logo.png',
                        S.of(context).welcome2,
                        S.of(context).welcomeDescription2,
                      ),
                      buildOnboardingPage(
                        'assets/images/aladia_logo.png',
                        S.of(context).welcome3,
                        S.of(context).welcomeDescription3,
                      ),
                      buildOnboardingPage(
                        'assets/images/aladia_logo.png',
                        S.of(context).welcome4,
                        S.of(context).welcomeDescription4,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    _currentPage < 3
                        ? ButtonContainerWidget(
                            isActive: true,
                            text: S.of(context).next,
                            onTapListener: () {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                          )
                        : ButtonContainerWidget(
                            isActive: true,
                            text: S.of(context).getStarted,
                            onTapListener: () {
                              context.push('/login');
                            },
                          ),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildPageIndicator(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildOnboardingPage(
      String imagePath, String title, String description) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(imagePath),
        SizedBox(height: 24.h),
        SizedBox(
          width: 380.w,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Expanded(
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).primaryColor.withOpacity(0.7),
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.50,
            ),
          ),
        )
      ],
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 4; i++) {
      indicators.add(
        i == _currentPage ? _buildIndicator(true) : _buildIndicator(false),
      );
    }
    return indicators;
  }

  Widget _buildIndicator(bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.h,
      width: isActive ? 24.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? const Color.fromARGB(255, 87, 165, 201) : Colors.grey,
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }
}
