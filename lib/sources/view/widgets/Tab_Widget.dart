import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/shared/app_theme.dart';

class TabWidget extends StatelessWidget {
  const TabWidget({super.key, required this.isSelected, required this.sourse});
  final bool isSelected;
  final String sourse;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      margin: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
          color: isSelected ? AppTheme.primary : AppTheme.white,
          borderRadius: BorderRadius.circular(25.r),
          border: Border.all(color: AppTheme.primary, width: 2)),
      child: Text(
        sourse,
        style: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(color: isSelected ? AppTheme.white : AppTheme.primary),
      ),
    );
  }
}
