import 'package:flutter/material.dart';

import '../../utils/index.dart';
import 'app_colors.dart';

class AppThemes {
  static ThemeData blueTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: _blueThemeColors.primary,
      appBarTheme: const AppBarTheme(centerTitle: false, elevation: 0),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      navigationBarTheme: NavigationBarThemeData(
        indicatorColor: _blueThemeColors.primary,
      ),
      extensions: [_blueThemeColors],
    );
  }

  AppColors get blueThemeColors => _blueThemeColors;

  static final _blueThemeColors = AppColors(
    primary: Utils.hexToColor("#0B99FF"),
    linearColor: [Utils.hexToColor("#349EFF"), Utils.hexToColor("#056EE9")],
  );

  static ThemeData orangeTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: Colors.amber,
      extensions: [_orangeThemeColor],
    );
  }

  static final _orangeThemeColor = AppColors(
    primary: Utils.hexToColor("#FF8811"),
    linearColor: [Utils.hexToColor("#FFA513"), Utils.hexToColor("#FF9300")],
  );

  static ThemeData purpleTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: Colors.amber,
      extensions: [_purpleThemeColor],
    );
  }

  static final _purpleThemeColor = AppColors(
    primary: Utils.hexToColor("#7D26D9"),
    linearColor: [Utils.hexToColor("#349EFF"), Utils.hexToColor("#056EE9")],
  );
}
