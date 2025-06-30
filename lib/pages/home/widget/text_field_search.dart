import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login/app/resouces/app_colors.dart';

import '../../../app/resouces/app_text_styles.dart';
import '../../../gen/assets.gen.dart';

Widget TextFSearch(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: context.colors.grey2,
      borderRadius: BorderRadius.all(Radius.circular(16.r)),
    ),
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    child: TextField(
      decoration: InputDecoration(
        hintText: 'Tìm kiếm',
        prefixIcon: SvgPicture.asset(
          Assets.icons.icSearch,
          colorFilter: ColorFilter.mode(context.colors.black, BlendMode.srcIn),
        ),
        prefixIconConstraints: BoxConstraints.expand(width: 20.w, height: 20.h),
        //prefixIconColor: context.colors.black,
        hintStyle: AppTextStyle.medium14.copyWith(
          color: context.colors.grey600,
        ),
        border: InputBorder.none,
      ),
    ),
  );
}
