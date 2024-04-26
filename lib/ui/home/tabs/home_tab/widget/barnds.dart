import 'package:e_commerce_app/ui/utils/categort_or_brand_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_app/domain/entities/categoryorbrandsresponse_entity.dart';

class Brands extends StatelessWidget {
  List<CategoryOrBrandsEntity> brandsList;
  Brands({
    Key? key,
    required this.brandsList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16),
        itemCount: brandsList.length,
        itemBuilder: (context, index) {
          return CategoryOrBrandItem(
              list: brandsList,
              url: brandsList[index].image ?? '',
              name: brandsList[index].name ?? '');
        },
      ),
    );
  }
}
/**
 *    return SingleChildScrollView(
            child: Column(
             // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                        borderRadius:
                            const BorderRadius.vertical(top: Radius.circular(8)),
                        child: Image.network(brandsList[index].image??''),
                        ),
                        InkWell(
                          onTap: () {
                            
                          },
                          child: Padding(
                            padding:  EdgeInsets.only(left: 110.w),
                            child: Image.asset(AppImages.favTabSelected,height: 50,),
                          ),
                        )
                  ],
                ),
                 SizedBox(
                  height: 7.h,
                ),
                 Padding(
                  padding: EdgeInsets.only(right: 10.w, left: 10.w),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 17.sp,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      const Text(
                        '000',
                        // (.voteAverage ?? 0).toStringAsFixed(1),
                      )
                    ],
                  ),
                ),
                 SizedBox(
                  height: 3.h,
                ),
                 Padding(
                  padding: EdgeInsets.only(right: 10.w, left: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'price2 581 Eg',
                        maxLines: 2,
                      ),
                      Image.asset(AppImages.add,height: 25,)
                    ],
                  ),
                ),
              ],
            ),
          );
 * 
 * 
 */