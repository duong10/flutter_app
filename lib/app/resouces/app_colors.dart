import 'package:flutter/material.dart';

import '../../utils/index.dart';
import 'app_themes.dart';

class AppColors extends ThemeExtension<AppColors> {
  Color neutral1 = Utils.hexToColor("#ADADAD");
  Color neutral2 = Utils.hexToColor("#F3F5F5");
  Color neutral3 = Utils.hexToColor("#5E758A");
  Color neutral4 = Utils.hexToColor("#E8E8E8");
  Color background = Utils.hexToColor("#F5F5FA");
  Color hintText = Utils.hexToColor("#848994");
  Color black = Utils.hexToColor("#27272A");
  Color white = Utils.hexToColor("#FFFFFF");
  Color red = Utils.hexToColor("#F41E21");
  Color red2 = Utils.hexToColor("#EE0004");
  Color redBg = Utils.hexToColor("#FFE5E6");
  Color grey1 = Utils.hexToColor("#F6F6F6");
  Color grey2 = Utils.hexToColor("#E8E8E8");
  Color grey3 = Utils.hexToColor("#DEDEDE");
  Color grey4 = Utils.hexToColor("#FCFDFD");
  Color green = Utils.hexToColor("#3FCB28");
  Color green2 = Utils.hexToColor("#26AE24");
  Color greenBlur = Utils.hexToColor("#DFFFE6");
  Color supportBlue = Utils.hexToColor("#DCE8FE");
  Color purple = Utils.hexToColor("#7D26D9");
  Color purple2 = Utils.hexToColor("#4B3DA5");
  Color purple3 = Utils.hexToColor("#B866FF");
  Color purpleBlue = Utils.hexToColor("#2E4FB1");
  Color orange = Utils.hexToColor("#FFA01B");
  Color orange2 = Utils.hexToColor("#FFA41B");
  Color orange3 = Utils.hexToColor("#FFF4E3");
  Color orange4 = Utils.hexToColor("#FF5900");
  Color orange5 = Utils.hexToColor("#FFD4A9");
  Color orange7 = Utils.hexToColor("#FFAB35");
  Color blue = Utils.hexToColor("#E7F2FF");
  Color blue2 = Utils.hexToColor("#E8F2FF");
  Color blue3 = Utils.hexToColor("#0B99FF");
  Color blue4 = Utils.hexToColor("#1B84FF");
  Color blue6 = Utils.hexToColor("#004A9E");
  Color blue7 = Utils.hexToColor("#F0F8FF");
  Color cell = Utils.hexToColor("#C0DEFF");
  Color border = Utils.hexToColor("#CCD6D8");
  Color border2 = Utils.hexToColor("#e2e5ec");
  Color pink = Utils.hexToColor("#FF4081");
  Color warning = Utils.hexToColor("#F6B100");
  Color infor = Utils.hexToColor("#7239EA");
  Color pink2 = Utils.hexToColor("#FFF0F1");
  Color divider = Utils.hexToColor("#EBEBF0");
  Color textSecondary = Utils.hexToColor("#64646D");
  Color backgroundLightBrand = Utils.hexToColor("#DBEEFF");
  Color outline = Utils.hexToColor("#DDDDE3");
  Color warning2 = Utils.hexToColor("#FFB700");
  Color grey200 = Utils.hexToColor("#F1F1F4");
  Color grey300 = Utils.hexToColor("#F2F2F2");
  Color grey600 = Utils.hexToColor("#78829D");
  Color green3 = Utils.hexToColor("#53B175");

  final Color primary;

  final List<Color> linearColor;

  AppColors({required this.primary, required this.linearColor});

  @override
  ThemeExtension<AppColors> copyWith({
    Color? primary,
    List<Color>? linearColor,
  }) {
    return AppColors(
      primary: primary ?? this.primary,
      linearColor: linearColor ?? this.linearColor,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(
    covariant ThemeExtension<AppColors>? other,
    double t,
  ) {
    if (other is! AppColors) {
      return this;
    }
    //render list color
    List<Color> lerpLinearColor = List.generate(linearColor.length, (index) {
      return Color.lerp(linearColor[index], other.linearColor[index], t) ??
          linearColor[index];
    });

    return AppColors(
      primary: Color.lerp(primary, other.primary, t)!,
      linearColor: lerpLinearColor,
    );
  }
}

extension AppColorExtension on ThemeData {
  /// Usage example: Theme.of(context).appColors;
  AppColors get appColors =>
      extension<AppColors>() ?? AppThemes().blueThemeColors;
}

extension ColorGetter on BuildContext {
  // Usage example: `context.theme`
  AppColors get colors => Theme.of(this).appColors;
}
