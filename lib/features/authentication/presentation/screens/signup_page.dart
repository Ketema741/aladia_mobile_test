import 'package:aladia_flutter_test/core/constants/app_text_styles.dart';
import 'package:aladia_flutter_test/core/utils/email_validation.dart';
import 'package:aladia_flutter_test/features/authentication/presentation/bloc/register_bloc.dart';
import 'package:aladia_flutter_test/features/authentication/presentation/widgets/btn_container.dart';
import 'package:aladia_flutter_test/features/authentication/presentation/widgets/custum_input_field.dart';
import 'package:aladia_flutter_test/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key, this.email});
    final String? email;


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

  bool isFirstNameFilled = false;
  bool isLastNameFilled = false;
  bool isEmailFilled = false;
  bool isPasswordFilled = false;
  bool isConfirmPasswordFilled = false;
  bool isPhoneNumberFilled = false;

  bool checkIsActive() {
    return isFirstNameFilled &&
        isLastNameFilled &&
        isEmailFilled &&
        isPasswordFilled &&
        isConfirmPasswordFilled &&
        isPhoneNumberFilled;
  }

  @override
  void initState() {
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController(text: widget.email ?? '');
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _signUpFormKey = GlobalKey<FormState>();
    isEmailFilled = _emailController.text.isNotEmpty;

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
    ScreenUtil.init(context, designSize: const Size(430, 932));
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            return Stack(
              children: [
                SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 12.h),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back_ios,
                              size: 20,
                              ),
                              onPressed: () {
                                context.go('/login');
                              },
                            ),
                            const SizedBox(width: 10),
                            Text(
                              S.of(context).signUp,
                              style: bodyLargeStyle,
                            ),
                          ],
                        ),
                        SizedBox(height: 28.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.5),
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
                              child: Image.asset(
                                'assets/images/aladia_logo.png',
                                height: 100,
                                width: 100,
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Nice to meet you,",
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      'Upload a profile picture and complete your presentation',
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
                        SizedBox(height: 16.h),
                        Text(
                          S.of(context).signUp,
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Form(
                          key: _signUpFormKey,
                          child: Column(
                            children: [
                              CustomTextFormField(
                                controller: _firstNameController,
                                hintText: S.of(context).firstName,
                                prefixIcon: const Icon(Icons.person),
                                onChanged: (value) {
                                  setState(() {
                                    isFirstNameFilled =
                                        _firstNameController.text.isNotEmpty;
                                  });
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'First name is required';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 16.h),
                              CustomTextFormField(
                                controller: _lastNameController,
                                hintText: S.of(context).lastName,
                                prefixIcon: const Icon(Icons.person),
                                onChanged: (value) {
                                  setState(() {
                                    isLastNameFilled =
                                        _lastNameController.text.isNotEmpty;
                                  });
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Last name is required';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 10.h),
                              CustomTextFormField(
                                controller: _emailController,
                                hintText: S.of(context).email,
                                prefixIcon: const Icon(Icons.email),
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
                                    return 'Invalid email format';
                                  }
                                  return null;
                                },
                                readOnly: widget.email != null,
                              ),
                              if (isEmailWrong)
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Invalid email format. Try again with a valid email',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              if (isEmailAlreadyExisted)
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Email already exists. Try again with another email',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              SizedBox(height: 10.h),
                              CustomTextFormField(
                                controller: _passwordController,
                                hintText: S.of(context).password,
                                isPasswordField: true,
                                prefixIcon: const Icon(Icons.lock),
                                onChanged: (value) {
                                  setState(() {
                                    isPasswordFilled =
                                        _passwordController.text.isNotEmpty;
                                  });
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Password is required';
                                  } else if (value.length < 8) {
                                    return 'Password should be at least 8 characters';
                                  }
                                  return null;
                                },
                              ),
                              if (isPasswordShort)
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Password should be at least 8 characters',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              SizedBox(height: 10.h),
                              CustomTextFormField(
                                controller: _confirmPasswordController,
                                hintText: S.of(context).confirmPassword,
                                isPasswordField: true,
                                prefixIcon: const Icon(Icons.lock),
                                onChanged: (value) {
                                  setState(() {
                                    isConfirmPasswordFilled =
                                        _confirmPasswordController
                                            .text.isNotEmpty;
                                  });
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Confirm Password is required';
                                  } else if (value !=
                                      _passwordController.text) {
                                    return 'Passwords do not match';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 10.h),
                              if (noConnection)
                                const Text(
                                  'No Internet Connection',
                                  style: TextStyle(color: Colors.red),
                                ),
                              SizedBox(height: 20.h),
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
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.h),
                                    child: ButtonContainerWidget(
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
                                        if (_signUpFormKey.currentState!
                                            .validate()) {
                                          BlocProvider.of<RegisterBloc>(context)
                                              .add(
                                            RegisterButtonPressedEvent(
                                              email: _emailController.text,
                                              password:
                                                  _passwordController.text,
                                              firstName:
                                                  _firstNameController.text,
                                              lastName:
                                                  _lastNameController.text,
                                              phoneNumber:
                                                  _phoneNumberController.text,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  );
                                },
                              ),
                              
                              SizedBox(height: 20.h),
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
                    )),
              ],
            );
          },
        ),
      ),
    );
  }
}
