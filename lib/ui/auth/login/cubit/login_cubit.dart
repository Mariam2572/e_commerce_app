import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/domain/entities/auth_result_entity.dart';
import 'package:e_commerce_app/domain/use_cases/login_use_case.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginUseCase}) : super(LoginInitial());
  LoginUseCase loginUseCase;
  TextEditingController e_mailController = TextEditingController();
  bool isObscure =true;
  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  Future<void> login() async {
    if (formKey.currentState?.validate() == true) {
      emit(LoginLoading());
      var either = await loginUseCase.invoke(
          e_mailController.text, passwordController.text);
      either.fold((l) => emit(LoginErrorState(errorMessage: l.errorMessage)),
          (r) => emit(LoginSuccessState(authResultEntity: r)));
    }
  }
}
