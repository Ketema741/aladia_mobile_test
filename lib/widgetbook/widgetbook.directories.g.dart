// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aladia_flutter_test/widgetbook/features/authentication/presentation/screens/signin_page.dart'
    as _i4;
import 'package:aladia_flutter_test/widgetbook/features/authentication/presentation/screens/singnup_page.dart'
    as _i3;
import 'package:aladia_flutter_test/widgetbook/features/authentication/presentation/widgets/button_container.dart'
    as _i8;
import 'package:aladia_flutter_test/widgetbook/features/authentication/presentation/widgets/container.dart'
    as _i2;
import 'package:aladia_flutter_test/widgetbook/features/authentication/presentation/widgets/custom_card.dart'
    as _i9;
import 'package:aladia_flutter_test/widgetbook/features/authentication/presentation/widgets/custom_text_field.dart'
    as _i10;
import 'package:aladia_flutter_test/widgetbook/features/authentication/presentation/widgets/social_media_btn.dart'
    as _i11;
import 'package:aladia_flutter_test/widgetbook/features/authentication/presentation/widgets/stepped_counter.dart'
    as _i12;
import 'package:aladia_flutter_test/widgetbook/features/customs/custom_knob.dart'
    as _i7;
import 'package:aladia_flutter_test/widgetbook/features/onboarding/presentation/screens/onboarding_page.dart'
    as _i5;
import 'package:aladia_flutter_test/widgetbook/features/splash/presentation/screens/splash.dart'
    as _i6;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookCategory(
    name: 'widgets',
    children: [
      _i1.WidgetbookFolder(
        name: 'containers',
        children: [
          _i1.WidgetbookComponent(
            name: 'Container',
            useCases: [
              _i1.WidgetbookUseCase(
                name: 'with different title',
                builder: _i2.myWidget,
              ),
              _i1.WidgetbookUseCase(
                name: 'with green color',
                builder: _i2.greenContainerUseCase,
              ),
            ],
          )
        ],
      )
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'features',
    children: [
      _i1.WidgetbookFolder(
        name: 'authentication',
        children: [
          _i1.WidgetbookFolder(
            name: 'presentation',
            children: [
              _i1.WidgetbookFolder(
                name: 'screens',
                children: [
                  _i1.WidgetbookComponent(
                    name: 'SignUpScreen',
                    useCases: [
                      _i1.WidgetbookUseCase(
                        name: 'SignUpScreen - Failure',
                        builder: _i3.signUpScreenFailureUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'SignUpScreen - Initial',
                        builder: _i3.signUpScreenInitialUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'SignUpScreen - Loading',
                        builder: _i3.signUpScreenLoadingUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'SignUpScreen - Success',
                        builder: _i3.signUpScreenSuccessUseCase,
                      ),
                    ],
                  ),
                  _i1.WidgetbookComponent(
                    name: 'SigninScreen',
                    useCases: [
                      _i1.WidgetbookUseCase(
                        name: 'SigninScreen - Failure',
                        builder: _i4.signinScreenFailureUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'SigninScreen - Initial',
                        builder: _i4.signinScreenInitialUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'SigninScreen - Loading',
                        builder: _i4.signinScreenLoadingUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'SigninScreen - Success',
                        builder: _i4.signinScreenSuccessUseCase,
                      ),
                    ],
                  ),
                ],
              )
            ],
          )
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'onboarding',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'OnboardingScreen',
            useCase: _i1.WidgetbookUseCase(
              name: 'OnboardingScreen',
              builder: _i5.onboardingScreenUseCase,
            ),
          )
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'splash',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'SplashScreen',
            useCase: _i1.WidgetbookUseCase(
              name: 'SplashScreen',
              builder: _i6.buildInactiveButtonUseCase,
            ),
          )
        ],
      ),
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'material',
    children: [
      _i1.WidgetbookLeafComponent(
        name: 'RangeSlider',
        useCase: _i1.WidgetbookUseCase(
          name: 'CustomRangeSlider',
          builder: _i7.rangeSlider,
        ),
      )
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'widgetbook',
    children: [
      _i1.WidgetbookFolder(
        name: 'features',
        children: [
          _i1.WidgetbookFolder(
            name: 'authentication',
            children: [
              _i1.WidgetbookFolder(
                name: 'widgets',
                children: [
                  _i1.WidgetbookComponent(
                    name: 'ButtonContainerWidget',
                    useCases: [
                      _i1.WidgetbookUseCase(
                        name: 'Active',
                        builder: _i8.buildActiveButtonUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Inactive',
                        builder: _i8.buildInactiveButtonUseCase,
                      ),
                    ],
                  ),
                  _i1.WidgetbookComponent(
                    name: 'CustomCard',
                    useCases: [
                      _i1.WidgetbookUseCase(
                        name: 'Default Style',
                        builder: _i9.defaultCustomCard,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'With Custom Background Color',
                        builder: _i9.customBackgroundCustomCard,
                      ),
                    ],
                  ),
                  _i1.WidgetbookComponent(
                    name: 'CustomTextField',
                    useCases: [
                      _i1.WidgetbookUseCase(
                        name: 'ConfirmPassowrd',
                        builder: _i10.confirmPasswordTextCustomTextField,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Default Style',
                        builder: _i10.defaultCustomTextField,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Email',
                        builder: _i10.emailTextCustomTextField,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Passowrd',
                        builder: _i10.passwordTextCustomTextField,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'firstName',
                        builder: _i10.nameTextCustomTextField,
                      ),
                    ],
                  ),
                  _i1.WidgetbookComponent(
                    name: 'SocialMediaBtn',
                    useCases: [
                      _i1.WidgetbookUseCase(
                        name: 'Apple',
                        builder: _i11.buildAppleButtonUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Facebook',
                        builder: _i11.builFacebookButtonUseCase,
                      ),
                      _i1.WidgetbookUseCase(
                        name: 'Google',
                        builder: _i11.buildgoogleButtonUseCase,
                      ),
                    ],
                  ),
                  _i1.WidgetbookLeafComponent(
                    name: 'SteppedCounter',
                    useCase: _i1.WidgetbookUseCase(
                      name: 'Default',
                      builder: _i12.steppedCounterUseCase,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      )
    ],
  ),
];
