import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:weight_mate/ui/common/app_colors.dart';

class NoQrPlaceholder extends StatelessWidget {
  const NoQrPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260.w,
      height: 260.h,
      decoration: BoxDecoration(
        color: kcLightSurfaceVariant,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Icon(Icons.qr_code_2_outlined, size: 80.r, color: kcLightHintText),
    );
  }
}
