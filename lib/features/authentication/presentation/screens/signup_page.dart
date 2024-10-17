import 'package:aladia_flutter_test/core/constants/app_text_styles.dart';
import 'package:aladia_flutter_test/core/theme/app_colors.dart';
import 'package:aladia_flutter_test/features/authentication/presentation/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../widgets/widgets.dart';
import 'package:aladia_flutter_test/generated/l10n.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  late TextEditingController _phoneNumberController;
  late GlobalKey<FormState> _signUpFormKey;
  bool isActive = false;

  bool isEmailAlreadyExisted = false;
  bool isEmailWrong = false;
  bool noConnection = false;
  bool isPasswordShort = false;

  late bool isFirstNameFilled = false;
  late bool isLastNameFilled = false;
  late bool isEmailFilled = false;
  late bool isPasswordFilled = false;
  late bool isConfirmPasswordFilled = false;
  late bool isPhoneNumberFilled = false;

  bool checkIsActive() {
    if (isFirstNameFilled &&
        isLastNameFilled &&
        isEmailFilled &&
        isPasswordFilled &&
        isConfirmPasswordFilled &&
        isPhoneNumberFilled) {
      return true;
    }
    return false;
  }

  @override
  void initState() {
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _signUpFormKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _confirmPasswordController.dispose();
    _passwordController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: BlocBuilder<RegisterBloc, RegisterState>(
            builder: (context, state) {
              return Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 28.h,
                            left: 25.w,
                            right: 25.w,
                          ),
                          child: SvgPicture.asset(
                            'assets/images/sign_up_image.svg',
                            height: 140.h,
                            width: 380.w,
                          ),
                        ),
                        Center(
                          child: Center(
                            child: Text(
                              S.of(context).signUp,
                              style: heading1Style,
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Form(
                          key: _signUpFormKey,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 25.w, vertical: 10.h),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          right: 5.h,
                                          top: 5.h,
                                        ),
                                        child: FormContainerWidget(
                                          onChanged: (value) {
                                            setState(() {
                                              isFirstNameFilled =
                                                  _firstNameController
                                                      .text.isNotEmpty;
                                            });
                                          },
                                          controller: _firstNameController,
                                          labelText: S.of(context).firstName,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'First name is required';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          left: 5.w,
                                          top: 5.h,
                                        ),
                                        child: FormContainerWidget(
                                          onChanged: (value) {
                                            setState(() {
                                              isLastNameFilled =
                                                  _lastNameController
                                                      .text.isNotEmpty;
                                            });
                                          },
                                          controller: _lastNameController,
                                          labelText: S.of(context).lastName,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Last Name is required';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 25.w, vertical: 10.h),
                                child: FormContainerWidget(
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
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              isEmailWrong
                                  ? const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Invalid email format. Try again with valid email',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    )
                                  : const SizedBox(),
                              isEmailAlreadyExisted
                                  ? const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Email already exists Try again with another email',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    )
                                  : const SizedBox(),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 25.w, vertical: 10.h),
                                child: FormContainerWidget(
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
                              ),
                              isPasswordShort
                                  ? const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Password should be at least 8 characters',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    )
                                  : const SizedBox(),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 25.w, vertical: 10.h),
                                child: FormContainerWidget(
                                  onChanged: (value) {
                                    setState(() {
                                      isConfirmPasswordFilled =
                                          _passwordController.text.isNotEmpty;
                                    });
                                  },
                                  controller: _confirmPasswordController,
                                  labelText: S.of(context).confirmPassword,
                                  isPasswordField: true,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Password is required';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 25.w, vertical: 10.h),
                                child: FormContainerWidget(
                                  inputType: TextInputType.phone,
                                  onChanged: (value) {
                                    setState(() {
                                      isPhoneNumberFilled =
                                          _phoneNumberController
                                              .text.isNotEmpty;
                                    });
                                  },
                                  controller: _phoneNumberController,
                                  labelText: S.of(context).phoneNumber,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Phone Number is required';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              noConnection
                                  ? const Text(
                                      'No Internet Connection',
                                      style: TextStyle(color: Colors.red),
                                    )
                                  : const SizedBox(),
                              const SizedBox(height: 20),
                              BlocConsumer<RegisterBloc, RegisterState>(
                                listener: (BuildContext context,
                                    RegisterState state) {
                                  if (state is RegisterFailureState) {
                                    if (state.error
                                        .contains('Email already exists')) {
                                      setState(() {
                                        isEmailAlreadyExisted = true;
                                      });
                                      return;
                                    }
                                    if (state.error
                                        .contains('Email should be')) {
                                      setState(() {
                                        isEmailWrong = true;
                                      });
                                      return;
                                    }
                                    if (state.error
                                        .contains('Password should have')) {
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

                                  if (state is RegisterSuccessState) {
                                    context
                                        .push('/otp/${_emailController.text}');
                                  }
                                },
                                builder: (BuildContext context,
                                    RegisterState state) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      left: 20.w,
                                      right: 20.w,
                                      top: 31.h,
                                    ),
                                    child: ButtonContainerWidget(
                                      color: AppColors.primaryButtonColor,
                                      text: state is RegisterLoadingState
                                          ? ''
                                          : S.of(context).signUp,
                                      isActive: checkIsActive(),
                                      onTapListener: () {
                                        setState(() {
                                          isEmailAlreadyExisted = false;
                                          isPasswordShort = false;
                                          isEmailWrong = false;
                                          noConnection = false;
                                        });
                                        BlocProvider.of<RegisterBloc>(context)
                                            .add(
                                          RegisterButtonPressedEvent(
                                            email: _emailController.text,
                                            password: _passwordController.text,
                                            firstName:
                                                _firstNameController.text,
                                            lastName: _lastNameController.text,
                                            phoneNumber:
                                                _phoneNumberController.text,
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10.h),
                                child: Center(
                                  child: Column(
                                    children: [
                                      Text(
                                        S.of(context).orSignUpWith,
                                        style: textPrimaryStyle,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 20.h),
                                        child: SvgPicture.asset(
                                          'assets/images/circular_button_google.svg',
                                          width: 55.w,
                                          height: 55.h,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 20.h),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              S.of(context).alreadyHaveAccount,
                                              style: textPrimaryStyle,
                                            ),
                                            const SizedBox(width: 5),
                                            GestureDetector(
                                              onTap: () => context.go('/login'),
                                              child: Text(
                                                S.of(context).login,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.primaryColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (state is RegisterLoadingState)
                    const Center(child: CircularProgressIndicator()),
                ],
              );
            },
          ),
        ));
  }
}
