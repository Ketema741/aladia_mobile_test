import 'package:aladia_flutter_test/core/constants/app_text_styles.dart';
import 'package:aladia_flutter_test/core/theme/app_colors.dart';
import 'package:aladia_flutter_test/core/utils/email_validation.dart';
import 'package:aladia_flutter_test/features/authentication/presentation/bloc/login_bloc.dart';
import 'package:aladia_flutter_test/features/authentication/presentation/widgets/button_container_widget.dart';
import 'package:aladia_flutter_test/features/authentication/presentation/widgets/input_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:aladia_flutter_test/generated/l10n.dart';


class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  bool isActive = false;
  late bool isEmailFilled = false;
  bool isEmailWrong = false;
  bool isPasswordShort = false;
  late bool isPasswordFilled = false;
  bool noConnection = false;
  bool invalidCredentials = false;

  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late GlobalKey<FormState> _signInFormKey;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _signInFormKey = GlobalKey<FormState>();
    super.initState();
  }

  bool checkIsActive() {
    if (isEmailFilled && isPasswordFilled) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(430, 932));
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 24.h),
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/aladia_logo.png',
                              height: 150,
                              width: 150,
                            ),
                            const Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Welcome to Aladia,',
                                    style: TextStyle(
                                      fontSize: 20, 
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  Text(
                                    'Create or access your account from here',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                    textAlign: TextAlign.start,
                                    softWrap:true,
                                    
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 40.h),
                        Text(
                          // 'Enter your email',
                          S.of(context).enterYourEmail,
                          style: heading2Style,
                        ),
                        SizedBox(height: 24.h),
                        Form(
                          key: _signInFormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FormContainerWidget(
                                onChanged: (value) {
                                  setState(() {
                                    isEmailFilled =
                                        _emailController.text.isNotEmpty;
                                  });
                                },
                                controller: _emailController,
                                labelText: S.of(context).email,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Email is required';
                                  } else if (validateEmail(value) == false) {
                                    return 'Invalid email';
                                  }
                                  return null;
                                },
                              ),
                              isEmailWrong
                                  ? const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Invalid email format. Try again with valid email',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    )
                                  : SizedBox(height: 16.h),
                              FormContainerWidget(
                                onChanged: (value) {
                                  setState(() {
                                    isPasswordFilled =
                                        _passwordController.text.isNotEmpty;
                                  });
                                },
                                controller: _passwordController,
                                labelText: S.of(context).password,
                                isPasswordField: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Password is required';
                                  }
                                  return null;
                                },
                              ),
                              isPasswordShort
                                  ? const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Password must be at least 8 characters',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    )
                                  : SizedBox(height: 16.h),
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
                                noConnection
                                    ? const Text(
                                        'No Internet Connection',
                                        style: TextStyle(color: Colors.red),
                                      )
                                    : const SizedBox(),
                                invalidCredentials
                                    ? const Text(
                                        'Invalid Credentials',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(color: Colors.red),
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 24.h),
                        BlocConsumer<LoginBloc, LoginState>(
                          listener: (context, state) {
                            if (state is LoginSuccessState) {
                              context.go('/home');
                            }
                            if (state is LoginFailureState) {
                              if (state.error
                                  .contains('Invalid email format')) {
                                setState(() {
                                  isEmailWrong = true;
                                });
                                return;
                              }
                              if (state.error.contains('Invalid email or')) {
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
                              color: AppColors.primaryButtonColor,
                              text: state is LoginLoadingState
                                  ? ''
                                  : S.of(context).login,
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
                        SizedBox(height: 15.h),
                        Text(
                          S.of(context).orLoginWith,
                          style: textPrimaryStyle,
                        ),
                        SizedBox(height: 10.h),
                        SvgPicture.asset(
                          'assets/images/circular_button_google.svg',
                          width: 55.w,
                          height: 55.h,
                        ),
                        SizedBox(height: 24.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              S.of(context).dontHaveAccount,
                              style: textPrimaryStyle,
                            ),
                            SizedBox(width: 2.w),
                            GestureDetector(
                              onTap: () => context.go('/signup'),
                              child: Text(
                                S.of(context).signUp,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryButtonColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
