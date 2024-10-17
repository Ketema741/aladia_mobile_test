import 'package:aladia_flutter_test/features/authentication/presentation/bloc/otp_bloc/otp_page_bloc.dart';
import 'package:aladia_flutter_test/features/authentication/presentation/bloc/otp_bloc/otp_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/widgets.dart';

class OtpPage extends StatefulWidget {
  final String email;
  const OtpPage({
    super.key,
    required this.email,
  });

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  bool isEmailWrong = false;
  bool noConnection = false;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: BlocBuilder<OtpBloc, OtpState>(
        builder: (context, state) {
          return Stack(
            children: [
              SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 0),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: 0.895.sh,
                      ),
                      child: IntrinsicHeight(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                                'assets/images/email_verification.svg'),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                'Verify Your Email',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 25.sp,
                                  height: 1.25,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 0,
                                vertical: 6.0.h,
                              ),
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    height: 1.2,
                                    fontFamily: 'Poppins',
                                    color: Colors.black87,
                                    letterSpacing: 0.5.sp,
                                  ),
                                  children: [
                                    const TextSpan(
                                      text:
                                          "Please enter the verification code sent to the email ",
                                    ),
                                    TextSpan(
                                      text: widget.email,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 0.08.sh),
                            BlocConsumer<OtpBloc, OtpState>(
                              listener: (BuildContext context, OtpState state) {
                                final state = context.read<OtpBloc>().state;
                                if (state is OtpLoadSuccess) {
                                  context.go('/login');
                                } else if (state is OtpLoadFailure) {
                                  if (state.error
                                      .contains('Invalid email format')) {
                                    setState(() {
                                      isEmailWrong = true;
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
                                    SnackBar(
                                      content: Text(state.error),
                                      duration: const Duration(seconds: 3),
                                    ),
                                  );
                                }
                              },
                              builder: (context, state) {
                                return OtpForm(email: widget.email);
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
                            noConnection
                                ? const Text(
                                    'No Internet Connection',
                                    style: TextStyle(color: Colors.red),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (state is OtpLoadInProgress)
                const CustomCircularProgressIndicator(),
            ],
          );
        },
      ),
    );
  }
}
