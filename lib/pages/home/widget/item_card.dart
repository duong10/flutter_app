import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login/app/resouces/app_colors.dart';

import '../../../gen/assets.gen.dart';

Widget ItemFood(BuildContext context) {
  return Container(
    height: 248.h,
    width: 173.w,
    decoration: BoxDecoration(
      border: Border.all(color: context.colors.grey2, width: 1),
      borderRadius: BorderRadius.all(Radius.circular(16.r)),
    ),
    child: Column(
      children: [
        SvgPicture.asset(
          Assets.icons.icLogo,
          colorFilter: ColorFilter.mode(context.colors.red, BlendMode.srcIn),
        ),
      ],
    ),
  );
}
