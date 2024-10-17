part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {}

class RegisterButtonPressedEvent extends RegisterEvent {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  RegisterButtonPressedEvent({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
  });
  
  @override
  List<Object?> get props => [email, password, firstName, lastName, phoneNumber];
}
