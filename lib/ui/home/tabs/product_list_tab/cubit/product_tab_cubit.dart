import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'product_tab_state.dart';

class ProductTabCubit extends Cubit<ProductTabState> {
  ProductTabCubit() : super(ProductTabInitial());
}
