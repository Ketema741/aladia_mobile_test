import 'package:aladia_flutter_test/features/authentication/domain/usecases/signup_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final SignupUserUsecase _registerUser;

  RegisterBloc({required SignupUserUsecase registerUseCase})
      : _registerUser = registerUseCase,
        super(RegisterInitialState()) {
    on<RegisterButtonPressedEvent>(
        (RegisterButtonPressedEvent event, Emitter<RegisterState> emit) async {
      emit(RegisterLoadingState());

      final result = await _registerUser.call(SignupParams(
        email: event.email,
        password: event.password,
        firstName: event.firstName,
        lastName: event.lastName,
        phoneNumber: event.phoneNumber,
      ));

      result
          .fold((error) => emit(RegisterFailureState(error: error.toString())),
              (user) {
        emit(RegisterSuccessState());
      });
    });
  }
}
