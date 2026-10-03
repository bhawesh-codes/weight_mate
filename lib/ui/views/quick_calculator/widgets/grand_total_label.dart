import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'package:weight_mate/ui/common/currency_helper.dart';

class GrandTotalLabel extends StatelessWidget {
  final double grandTotal;

  const GrandTotalLabel({super.key, required this.grandTotal});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const BodyTextWidget(
          text: 'Grand Total',
          textType: TextType.medium,
          color: kcLightSecondaryText,
          fontWeight: FontWeight.w500,
        ),
        const Spacer(),
        Text(
          '$currencySymbol ${grandTotal.toStringAsFixed(2)}',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 38.sp,
            fontWeight: FontWeight.w700,
            color: kcPrimaryColor,
            letterSpacing: -0.02,
          ),
        ),
      ],
    );
  }
}
