import 'package:e_commerce_app/ui/utils/categort_or_brand_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:e_commerce_app/domain/entities/categoryorbrandsresponse_entity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  List<CategoryOrBrandsEntity> categoriesList;
  CategoryItem({
    Key? key,
    required this.categoriesList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
             mainAxisSpacing: 16, 
             crossAxisSpacing: 16),
        itemCount: categoriesList.length,
        itemBuilder: (context, index) {
          return CategoryOrBrandItem(
              list: categoriesList,
              url: categoriesList[index].image ?? '',
              name: categoriesList[index].name ?? '');
        },
      ),
    );
  }
}
