part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitialState extends LoginState {
  LoginInitialState();
}

class LoginLoadingState extends LoginState {
  LoginLoadingState();
}

class LoginSuccessState extends LoginState {
  final String token;
  LoginSuccessState({required this.token});
}

class LoginFailureState extends LoginState {
  final String error;
  LoginFailureState({required this.error});
}
