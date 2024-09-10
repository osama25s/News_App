import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/shared/app_theme.dart';
import 'package:news_app/categories/data/models/Category_Model.dart';

class CotegoryItem extends StatelessWidget {
  final int indexitem;
  final CategoryModel category;
  const CotegoryItem(
      {super.key, required this.indexitem, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(25.r),
          topEnd: Radius.circular(25.r),
          bottomStart: Radius.circular(indexitem.isEven ? 25.r : 0),
          bottomEnd: Radius.circular(indexitem.isEven ? 0 : 25.r),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            category.image,
            width: 124.w,
            height: 115.h,
          ),
          Text(
            category.lable,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
