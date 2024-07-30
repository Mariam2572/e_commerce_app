import 'package:dartz/dartz.dart';

import '../../entities/failures.dart';
import '../../entities/wish_list_response_entity.dart';

abstract class WishListDataSource {
  Future<Either<Failures, WishListResponseEntity>> addToWishList(String productId);
}