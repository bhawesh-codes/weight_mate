import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:weight_mate/ui/common/app_colors.dart';

class SettingsDivider extends StatelessWidget {
  const SettingsDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      height: 1,
      color: kcLightBorder.withValues(alpha: 0.2),
    );
  }
}
