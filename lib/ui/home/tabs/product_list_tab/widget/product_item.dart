
import 'package:e_commerce_app/domain/di.dart';
import 'package:e_commerce_app/ui/home/product_details/product_details.dart';
import 'package:e_commerce_app/ui/home/product_details/widgets/rating_widget.dart';
import 'package:e_commerce_app/ui/home/tabs/product_list_tab/cubit/product_tab_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_app/domain/entities/product_response_entity.dart';
import 'package:e_commerce_app/ui/utils/app_images.dart';
import '../../../../utils/app_color.dart';

class ProductItem extends StatefulWidget {
  ProductEntity productEntity;
  ProductItem({
    Key? key,
    required this.productEntity,
  }) : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 191.w,
      height: 300.h,
      margin: const EdgeInsets.all(8),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          border: Border.all(
            color: AppColors.mainColor,
            width: 1.w,
          )),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 2.7 / 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: InkWell(
                      onTap: () => Navigator.pushNamed(
                        context,
                        ProductDetails.routeName,
                        arguments: widget.productEntity,
                      ),
                      child: Image.network(
                        widget.productEntity.imageCover ?? '',
                        fit: BoxFit.fill,
                        width: 191.w,
                        height: 128.h,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 5.h,
                  right: 3.5.w,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 15,
                    child: BlocListener<ProductTabCubit, ProductTabState>(
                        bloc: ProductTabCubit(
                            addCartUseCase: injectAddCartUseCase(),
                            addToWishListUseCase: injectAddToWishListUseCase(),
                            getAllProductUseCase: injectGetAllProductUseCase()),
                        child: IconButton(
                          color: AppColors.mainColor,
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            isFavorite = !isFavorite;
                            setState(() {
                              ProductTabCubit.get(context)
                                  .addToWishList(widget.productEntity.id ?? '');
                            });
                          },
                          icon: isFavorite == true
                              ? const Icon(Icons.favorite_rounded)
                              : const Icon(
                                  Icons.favorite_border_rounded,
                                ),
                        ),
                        listenWhen: (previous, current) =>
                            current is AddToWishListSuccess,
                        listener: (context, state) {
                          if (state is AddToWishListSuccess &&
                              state.productId == widget.productEntity.id) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Added to wish list!'),
                                backgroundColor: Colors.green,
                              ),
                            );
                          }
                        }),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 7.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                widget.productEntity.title ?? '',
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "EGP ${widget.productEntity.price.toString()}",
                style: Theme.of(context).textTheme.titleSmall,
                maxLines: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RatingWidget(
                    rating: widget.productEntity.ratingsAverage.toString(),
                  ),
                  InkWell(
                    onTap: () {
                      
                      ProductTabCubit.get(context)
                          .addToCart(widget.productEntity.id ?? '');
                    },
                    child: BlocConsumer<ProductTabCubit, ProductTabState>(
                      listenWhen: (previous, current) =>
                          current is AddToCartSuccess ||
                          current is AddToCartError,
                      listener: (context, state) {
                        if (state is AddToCartSuccess &&
                            state.productId == widget.productEntity.id) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Row(
                                children: [
                                  Icon(
                                    Icons.check_circle,
                                    color: Colors.white, 
                                  ),
                                  SizedBox(
                                      width:
                                          10), 
                                  Text(
                                    'Added to cart!',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              backgroundColor: Colors.green,
                              behavior: SnackBarBehavior
                                  .floating, 
                              margin:
                                  const EdgeInsets.all(16), 
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10), 
                              ),
                              duration:
                                  const Duration(seconds: 2), 
                            ),
                          );
                        } else if (state is AddToCartError) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Failed to add to cart: ${state.errorMessage}'),
                              backgroundColor: Colors.red,
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        }
                      },
                      buildWhen: (previous, current) =>
                          current is AddToCartLoading ||
                          current is AddToCartSuccess,
                      builder: (context, state) {
                        if (state is AddToCartLoading &&
                            state.productId == widget.productEntity.id) {
                          return const CircularProgressIndicator
                              .adaptive(); 
                        } else if (state is AddToCartSuccess &&
                            state.productId == widget.productEntity.id) {
                          return const Icon(Icons.check_circle,
                          
                              color: AppColors.mainColor,
                              ); 
                        }
                        return Image.asset(
                          AppImages.add,
                          height: 25, 
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
