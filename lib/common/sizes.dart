import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenSize {
  // Initialize screen size utilities
  static double get width => ScreenUtil().screenWidth;
  static double get height => ScreenUtil().screenHeight;
  static double get textScaleFactor => ScreenUtil().textScaleFactor;

  // Padding & Margin
  static double get kPaddingSmall => 16;
  static double get kPaddingMedium => 24;
  static double get kPaddingLarge => 30;

  // Font Sizes
  static double get kFontSmall => 10.0.sp;
  static double get kFontMedium => 16.0.sp;
  static double get kFontLarge => 20.0.sp;
  static double get kFontXLarge => 24.0.sp;

  // Border Radius
  static double get kRadiusSmall => 8;
  static double get kRadiusMedium => 12;
  static double get kRadiusLarge => 20;
  static double get kRadiusXLarge => 30;
}
