import 'package:aladia_flutter_test/core/utils/email_validation.dart';
import 'package:aladia_flutter_test/features/authentication/presentation/bloc/login_bloc.dart';
import 'package:aladia_flutter_test/features/authentication/presentation/widgets/custum_input_field.dart';
import 'package:aladia_flutter_test/widgetbook/features/authentication/presentation/widgets/button_container.dart';
import 'package:aladia_flutter_test/widgetbook/features/authentication/presentation/widgets/social_media_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:aladia_flutter_test/generated/l10n.dart';


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


class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  bool isActive = false;
  bool isEmailFilled = false;
  bool isEmailWrong = false;
  bool isPasswordShort = false;
  bool isPasswordFilled = false;
  bool noConnection = false;
  bool invalidCredentials = false;

  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late GlobalKey<FormState> _signInFormKey;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _signInFormKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool checkIsActive() {
    return isEmailFilled && isPasswordFilled;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(430, 932));
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Stack(
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 24.h), // mobile@aladia.io Pass@123
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.5),
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.2),
                              Colors.black.withOpacity(0.02),
                            ],
                            begin: Alignment.topRight,
                            end: Alignment.bottomCenter,
                            stops: const [0.4, 0.75, 1],
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Image(
                              image: AssetImage(
                                'assets/images/aladia_logo.png',
                              ),
                              // height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${S.of(context).welcome},",
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "${S.of(context).createAccountOrSignup}",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.3),
                                      ),
                                      textAlign: TextAlign.start,
                                      softWrap: true,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40.h),
                      Text(
                        S.of(context).enterYourEmail,
                        style: TextStyle(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.75),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.15,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Form(
                        key: _signInFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextFormField(
                              controller: _emailController,
                              hintText: S.of(context).email,
                              isPasswordField: false,
                              onChanged: (value) {
                                setState(() {
                                  isEmailFilled =
                                      _emailController.text.isNotEmpty;
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Email is required';
                                } else if (!validateEmail(value)) {
                                  return 'Invalid email';
                                }
                                return null;
                              },
                              prefixIcon: const Icon(Icons.email),
                            ),
                            if (isEmailWrong)
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Invalid email format. Try again with valid email',
                                  style: TextStyle(color: Colors.red),
                                ),
                              )
                            else
                              SizedBox(height: 16.h),
                            CustomTextFormField(
                              controller: _passwordController,
                              hintText: S.of(context).password,
                              isPasswordField: true,
                              onChanged: (value) {
                                setState(() {
                                  isPasswordFilled =
                                      _passwordController.text.isNotEmpty;
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password is required';
                                }
                                return null;
                              },
                            ),
                            if (isPasswordShort)
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Password must be at least 8 characters',
                                  style: TextStyle(color: Colors.red),
                                ),
                              )
                            else
                              SizedBox(height: 16.h),
                          ],
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (noConnection)
                                const Text(
                                  'No Internet Connection',
                                  style: TextStyle(color: Colors.red),
                                ),
                              if (invalidCredentials)
                                const Text(
                                  'Invalid Credentials',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(color: Colors.red),
                                ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),
                      BlocConsumer<LoginBloc, LoginState>(
                        listener: (context, state) {
                          if (state is LoginSuccessState) {
                            context.push('/home');
                          }
                          if (state is LoginFailureState) {
                            if (state.error.contains('Invalid email format')) {
                              setState(() {
                                isEmailWrong = true;
                              });
                              return;
                            }
                            if (state.error.contains('Validation Exception')) {
                              setState(() {
                                isEmailWrong = true;
                              });
                              return;
                            }
                            if (state.error.contains('Invalid credential')) {
                              setState(() {
                                invalidCredentials = true;
                              });
                              return;
                            }
                            if (state.error.contains('Password must be at')) {
                              setState(() {
                                isPasswordShort = true;
                              });
                              return;
                            }
                            if (state.error
                                .contains('No internet connection')) {
                              setState(() {
                                noConnection = true;
                              });
                              return;
                            }
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.error)),
                            );
                          }
                        },
                        builder: (context, state) {
                          return ButtonContainerWidget(
                            text: state is LoginLoadingState
                                ? ''
                                : S.of(context).enter,
                            isActive: checkIsActive(),
                            onTapListener: () {
                              setState(() {
                                isEmailWrong = false;
                                isPasswordShort = false;
                                invalidCredentials = false;
                                noConnection = false;
                              });
                              BlocProvider.of<LoginBloc>(context).add(
                                LoginButtonPressedEvent(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                ),
                              );
                            },
                          );
                        },
                      ),
                      SizedBox(height: 24.h),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 2,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.transparent,
                                    Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.5),
                                    Theme.of(context).primaryColor,
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                              ),
                              margin: const EdgeInsets.only(right: 10),
                            ),
                          ),
                          Text(
                            S.of(context).orLoginWith,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 2,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Theme.of(context).primaryColor,
                                    Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.6),
                                    Colors.transparent,
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                              ),
                              margin: const EdgeInsets.only(left: 10),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),
                      const SocialMediaBtn(
                        text: "Google",
                        iconPath: 'assets/icons/google.png',
                      ),
                      SizedBox(height: 24.h),
                      const SocialMediaBtn(
                        text: "Facebook",
                        iconPath: 'assets/icons/facebook.png',
                      ),
                      SizedBox(height: 24.h),
                      const SocialMediaBtn(
                        text: "Apple",
                        iconPath: 'assets/icons/apple.png',
                      ),
                      SizedBox(height: 24.h),
                      GestureDetector(
                        onTap: () => context.push('/signup'),
                        child: Text(
                          S.of(context).signUp,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Terms and conditions",
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

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
