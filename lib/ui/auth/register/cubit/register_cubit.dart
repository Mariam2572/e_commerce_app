import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/domain/use_cases/register_use_case.dart';
import 'package:e_commerce_app/ui/auth/register/cubit/states.dart';
import 'package:flutter/material.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit({required this.registerUseCase})
      : super(RegisterLoadingStates());
  var formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool isObscure = true;
  RegisterUseCase registerUseCase;

  var form = GlobalKey<FormState>();
 void register() async {
 if (form.currentState?.validate() == true) {
    emit(RegisterLoadingStates());
     var either = await registerUseCase.invoke(
        nameController.text,
        emailController.text,
        passwordController.text,
        rePasswordController.text,
        phoneController.text
        );
    either.fold((l) =>
      emit(RegisterErrorStates(errorMsg: l.errorMessage))
    , (r) =>
      emit(RegisterSuccessStates(authResultEntity: r))
    );
  }
 }
}
