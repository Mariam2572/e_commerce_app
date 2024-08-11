part of 'home_tab_cubit.dart';

@immutable
sealed class HomeTabState {}

final class HomeTabInitial extends HomeTabState {}

final class HomeTabLoading extends HomeTabState {}

final class HomeTabError extends HomeTabState {
  Failures? failures;
  HomeTabError({required this.failures});
}

final class HomeTabSuccess extends HomeTabState {
  CategoryOrBrandsResponseEntity categoryOrBrandsResponseEntity;
  HomeTabSuccess({required this.categoryOrBrandsResponseEntity});
}

final class SearchError extends HomeTabState {}
final class SearchSuccess extends HomeTabState {
  List<ProductEntity> searchProductList;
 
  SearchSuccess({required this.searchProductList});

}
