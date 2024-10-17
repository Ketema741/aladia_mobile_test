import 'package:equatable/equatable.dart';

abstract class OtpState extends Equatable {
  @override
  List<Object?> get props => [];
}

class OtpIdle extends OtpState {}

class OtpLoadInProgress extends OtpState {}

class OtpLoadSuccess extends OtpState {}

class OtpLoadFailure extends OtpState {
  final String error;

  OtpLoadFailure({required this.error});

  @override
  List<Object?> get props => [error];
}
