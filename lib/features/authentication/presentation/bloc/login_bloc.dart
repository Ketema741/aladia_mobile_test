import 'package:aladia_flutter_test/features/authentication/domain/usecases/signin_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final SigninUserUsecase _loginUser;

  LoginBloc({required SigninUserUsecase loginUseCase})
      : _loginUser = loginUseCase,
        super(LoginInitialState()) {
    on<LoginButtonPressedEvent>(
        (LoginButtonPressedEvent event, Emitter<LoginState> emit) async {
      emit(LoginLoadingState());

      final result = await _loginUser
          .call(LoginParams(email: event.email, password: event.password));

      result.fold((error) => emit(LoginFailureState(error: error.message)),
          (token) {
        emit(LoginSuccessState(token: token));
      });
    });
  }
}
