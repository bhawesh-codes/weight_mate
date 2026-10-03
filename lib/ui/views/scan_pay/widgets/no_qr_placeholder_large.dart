import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/ui/common/app_colors.dart';

class NoQrPlaceholderLarge extends StatelessWidget {
  const NoQrPlaceholderLarge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 60.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: kcLightBorder.withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          Icon(Icons.qr_code_2_outlined, size: 80.r, color: kcLightHintText),
          UIHelper.verticalSpaceMedium,
          const BodyTextWidget(
            text: 'No Payment QR Set Up',
            textType: TextType.smedium,
            color: kcLightSecondaryText,
            fontWeight: FontWeight.w500,
          ),
          UIHelper.verticalSpace(4.h),
          const BodyTextWidget(
            text: 'Please upload a QR code in Settings',
            textType: TextType.small,
            color: kcLightSecondaryText,
          ),
        ],
      ),
    );
  }
}
