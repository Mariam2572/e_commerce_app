import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/domain/entities/categoryorbrandsresponse_entity.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/entities/product_response_entity.dart';
import 'package:e_commerce_app/domain/use_cases/home_tab_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'home_tab_state.dart';

class HomeTabCubit extends Cubit<HomeTabState> {
  final GetAllCategoriesUseCase getAllCategoriesUseCase;
  final GetAllBrandsUseCase getAllBrandsUseCase;
  final GetAllProductUseCase getAllProductUseCase;
  List<CategoryOrBrandsEntity> categoriesList = [];
  List<CategoryOrBrandsEntity> brandsLiesList = [];
  List<ProductEntity> allProductList = [];
  final TextEditingController searchTextController = TextEditingController();

  HomeTabCubit({
    required this.getAllCategoriesUseCase,
    required this.getAllBrandsUseCase,
    required this.getAllProductUseCase,
  }) : super(HomeTabInitial());

  Future<void> fetchAllProducts() async {
    emit(HomeTabLoading());
    var either = await getAllProductUseCase.invoke();
    either.fold(
      (l) => emit(HomeTabError(failures: l)),
      (r) {
        allProductList = r.data ?? [];
        emit(SearchSuccess(searchProductList: allProductList));
      },
    );
  }

  void search(String text) {
    if (text.isEmpty) {
      emit(SearchSuccess(searchProductList: allProductList));
    } else {
      emit(SearchSuccess(
        searchProductList: allProductList
            .where((product) =>
                product.title!.toLowerCase().contains(text.toLowerCase()))
            .toList(),
      ));
    }
  }

  Future<void> getAllCategories() async {
    emit(HomeTabLoading());
    var either = await getAllCategoriesUseCase.invoke();
    either.fold(
      (l) => emit(HomeTabError(failures: l)),
      (r) {
        categoriesList = r.data ?? [];
        emit(HomeTabSuccess(categoryOrBrandsResponseEntity: r));
      },
    );
  }

  Future<void> getAllBrands() async {
    emit(HomeTabLoading());
    var either = await getAllBrandsUseCase.invoke();
    either.fold(
      (l) => emit(HomeTabError(failures: l)),
      (r) {
        brandsLiesList = r.data ?? [];
        emit(HomeTabSuccess(categoryOrBrandsResponseEntity: r));
      },
    );
  }

  @override
  Future<void> close() {
    searchTextController.dispose();
    return super.close();
  }
}
