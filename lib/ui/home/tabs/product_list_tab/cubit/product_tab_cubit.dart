import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/entities/product_response_entity.dart';
import 'package:e_commerce_app/domain/use_cases/home_tab_use_case.dart';
import 'package:meta/meta.dart';

part 'product_tab_state.dart';

class ProductTabCubit extends Cubit<ProductTabState> {
  ProductTabCubit({ required this.getAllProductUseCase}) : super(ProductTabInitial());
  GetAllProductUseCase getAllProductUseCase;
List<ProductEntity> productList = [];
  Future<void> getAllProducts() async {
    emit(ProductTabLoading());
var either = await getAllProductUseCase.invoke();
either.fold((l) => emit(ProductTabError(errorMessage: l))
, (r) {
  productList = r.data??[];
  emit(ProductTabSuccess(productResponseEntity: r),
  );
  }
  );
  }

}
