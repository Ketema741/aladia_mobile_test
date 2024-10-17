import 'dart:async';
import 'package:aladia_flutter_test/core/theme/app_colors.dart';
import 'package:aladia_flutter_test/features/authentication/presentation/bloc/otp_bloc/otp_page_bloc.dart';
import 'package:aladia_flutter_test/features/authentication/presentation/bloc/otp_bloc/otp_page_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets.dart';

class OtpForm extends StatefulWidget {
  final String email;
  const OtpForm({super.key, required this.email});

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  final List<TextEditingController> _controllers =
      List.generate(4, (_) => TextEditingController());
  final List<bool> _hasInput = List.generate(4, (_) => false);
  bool _isButtonActive = false;
  Timer? _timer;
  int _remainingTime = 1200000;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < _controllers.length; i++) {
      _controllers[i].addListener(() {
        setState(() {
          _hasInput[i] = _controllers[i].text.isNotEmpty;
        });
      });
    }
    _startTimer();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (_remainingTime == 0) {
        setState(() {
          timer.cancel();
          _isButtonActive = false;
        });
      } else {
        setState(() {
          _remainingTime--;
        });
      }
    });
  }

  String formatDuration(int totalSeconds) {
    int minutes = (totalSeconds % 3600) ~/ 60;
    int seconds = totalSeconds % 60;

    String formattedTime =
        "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
    return formattedTime;
  }

  void _checkFields() {
    final isFieldsFilled =
        _controllers.every((controller) => controller.text.isNotEmpty);
    if (isFieldsFilled != _isButtonActive) {
      setState(() => _isButtonActive = isFieldsFilled);
    }
  }

  String _getConcatenatedOtpValues() {
    return _controllers.map((controller) => controller.text).join('');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      child: SizedBox(
        width: 1.sw,
        child: Form(
            child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SizedBox(
              width: 0.5.sw,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20.h),
                  // BlocListener<OtpBloc, OtpState>(
                  //   listener: (context, state) {
                  //     if (state is OtpLoadFailure) {
                  //       const Text('Invalid OTP');
                  //     }
                  //   },
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      _controllers.length,
                      (index) => SizedBox(
                        height: 49.h,
                        width: 40.w,
                        child: TextFormField(
                          controller: _controllers[index],
                          autofocus: index == 0,
                          onChanged: (value) {
                            _checkFields();
                            if (value.length == 1 &&
                                index < _controllers.length - 1) {
                              FocusScope.of(context).nextFocus();
                            }
                            setState(() {});
                          },
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(1)
                          ],
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(4.w, 0, 0, 8.h),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 230, 230, 230),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: BorderSide(
                                color: AppColors.primaryColor,
                                width: 1.w,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: BorderSide(
                                color: AppColors.primaryColor,
                                width: 1.w,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 0.01.sh),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Did not receive the code? ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12.sp,
                          height: 25 / 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: Colors.black45,
                        ),
                      ),
                      Text(
                        "Resend Code",
                        style: TextStyle(
                          fontSize: 12.sp,
                          height: 25 / 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 0.01.sh),
                  Text(
                    formatDuration(_remainingTime),
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 0.08.sh),
                  SizedBox(
                      width: 1.sw,
                      child: ButtonContainerWidget(
                        color: AppColors.primaryButtonColor,
                        text: 'Verify',
                        isActive: _isButtonActive,
                        onTapListener: () {
                          final otpValue = _getConcatenatedOtpValues();
                          context.read<OtpBloc>().add(OtpSubmitted(
                                code: otpValue,
                                email: widget.email,
                              ));
                        },
                      ))
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
