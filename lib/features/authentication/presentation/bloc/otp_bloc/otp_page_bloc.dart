import 'package:aladia_flutter_test/features/authentication/domain/usecases/verify_otp_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'otp_page_event.dart';
import 'otp_page_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  OtpBloc({required VerifyOtpUseCase verifyOtpUseCase})
      : _verifyOtpUseCase = verifyOtpUseCase,
        super(OtpIdle()) {
    on<OtpSubmitted>(_otpHandler);
  }

  final VerifyOtpUseCase _verifyOtpUseCase;

  Future<void> _otpHandler(event, emit) async {
    emit(OtpLoadInProgress());
    final result = await _verifyOtpUseCase.call(
      VerifyOtpParams(
        otp: event.code,
        email: event.email,
      ),
    );

    result.fold(
      (error) => emit(OtpLoadFailure(error: error.toString())),
      (message) => emit(OtpLoadSuccess()),
    );
  }
}
