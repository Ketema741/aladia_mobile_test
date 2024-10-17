import 'dart:io' show Platform;
import 'package:aladia_flutter_test/core/constants/app_text_styles.dart';
import 'package:aladia_flutter_test/core/theme/app_colors.dart';
import 'package:aladia_flutter_test/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../authentication/presentation/widgets/widgets.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
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

    S.load(locale); // Update the language
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
      containerHeight = 600.0;
    } else if (Platform.isAndroid || Platform.isIOS) {
      // Height for mobile platforms (Android/iOS)
      containerHeight = 510.0;
    } else if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      // Height for desktop platforms
      containerHeight = 700.0;
    } else {
      // Default height for other platforms
      containerHeight = 600.0;
    }
    List<String> options = <String>[
      'English',
      'Italiano',
    ];
    ScreenUtil.init(context, designSize: const Size(430, 932));
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 23),
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
                        dropdownColor: Colors.white,
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
                                color: _selectedOption == value
                                    ? AppColors.primaryColor
                                    : Colors.black,
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
                    TextButton(
                      onPressed: () {
                        context.push("/home");
                      },
                      child: Text(
                        S.of(context).skip,
                        style: TextStyle(
                          color: const Color(0xFF5F95DC),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          height: 1.2,
                          letterSpacing: 0.10,
                        ),
                      ),
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
                // SizedBox(height: 16.h),
                Column(
                  children: [
                    _currentPage < 3
                        ? ButtonContainerWidget(
                            isActive: true,
                            color: AppColors.primaryButtonColor,
                            // text: 'Next',
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
                            color: AppColors.primaryButtonColor,
                            // text: 'Get Started',
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
        SizedBox(height: 30.h),
        SizedBox(
          width: 380.w,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: heading1Style,
          ),
        ),
        SizedBox(height: 8.h),
        Expanded(
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF778293),
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
