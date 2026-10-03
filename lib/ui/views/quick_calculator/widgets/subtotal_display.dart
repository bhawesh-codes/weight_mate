import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'package:weight_mate/ui/common/currency_helper.dart';

class SubtotalDisplay extends StatelessWidget {
  final double subtotal;

  const SubtotalDisplay({super.key, required this.subtotal});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: kcPrimaryContainer,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const BodyTextWidget(
            text: 'Total',
            textType: TextType.xxsmall,
            color: kcLightSecondaryText,
          ),
          UIHelper.verticalSpaceXXSmall,
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              formatPrice(subtotal),
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: kcPrimaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
