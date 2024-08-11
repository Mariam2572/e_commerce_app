// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:e_commerce_app/domain/entities/get_user_info_entity.dart';
import 'package:e_commerce_app/domain/use_cases/get_user_data_use_case.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  GetUserInfoUseCase getUserInfoUseCase;
 
  ProfileCubit({
    required this.getUserInfoUseCase,

  }) : super(ProfileInitial());

  getUserInfo() async {
    emit(ProfileInitial());
    var either = await getUserInfoUseCase.invoke();
    either.fold((l) => emit(ProfileError(errorMessage: l.errorMessage)), (r) {
      


      emit(
        ProfileSuccess(r),
      );
    });
  }
}
