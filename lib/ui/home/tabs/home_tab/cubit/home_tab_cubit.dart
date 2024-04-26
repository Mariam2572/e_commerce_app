import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/domain/entities/categoryorbrandsresponse_entity.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/use_cases/home_tab_use_case.dart';
import 'package:meta/meta.dart';

part 'home_tab_state.dart';

class HomeTabCubit extends Cubit<HomeTabState> {
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  GetAllBrandsUseCase getAllBrandsUseCase;
  List<CategoryOrBrandsEntity> categoriesList = [];
  List<CategoryOrBrandsEntity> brandsLiesList = [];
  HomeTabCubit({required this.getAllCategoriesUseCase,required this.getAllBrandsUseCase})
      : super(HomeTabInitial());
  Future<void> getAllCategories() async {
    emit(HomeTabLoading());
    var either = await getAllCategoriesUseCase.invoke();
    either.fold((l) => emit(HomeTabError(failures: l)),
     (r) {
      categoriesList = r.data ?? [];
      emit(HomeTabSuccess(categoryOrBrandsResponseEntity: r));
    });
  }  Future<void> getAllBrands() async {
    emit(HomeTabLoading());
    var either = await getAllBrandsUseCase.invoke();
    either.fold((l) => emit(HomeTabError(failures: l)),
     (r) {
      brandsLiesList = r.data ?? [];
      emit(HomeTabSuccess(categoryOrBrandsResponseEntity: r));
    });
  }
}
