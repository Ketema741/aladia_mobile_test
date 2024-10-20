abstract class OtpEvent {}

class OtpSubmitted extends OtpEvent {
  final String code;
  final String email;
  OtpSubmitted({required this.code, required this.email});
}

class OtpResendRequested extends OtpEvent {}
