import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/ui/common/app_colors.dart';

class StoreBadge extends StatelessWidget {
  final String storeName;
  const StoreBadge({super.key, required this.storeName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: kcPrimaryContainer,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: BodyTextWidget(
        text: storeName,
        textType: TextType.xsmall,
        color: kcPrimaryColor,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
