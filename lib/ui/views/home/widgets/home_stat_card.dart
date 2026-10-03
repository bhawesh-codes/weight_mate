import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/base/widgets/text/title_text.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'package:weight_mate/ui/common/currency_helper.dart';

class HomeStatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final double change;
  final bool isMonetary;

  const HomeStatCard({
    required this.icon,
    required this.label,
    required this.value,
    this.change = 0,
    this.isMonetary = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12.w, 10.h, 12.w, 10.h),
      decoration: BoxDecoration(
        color: kcPrimaryContainer,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(icon, color: kcPrimaryColor, size: 16.r),
              SizedBox(width: 4.w),
              BodyTextWidget(
                text: label,
                textType: TextType.xxsmall,
                color: kcLightSecondaryText,
              ),
            ],
          ),
          UIHelper.verticalSpace(4.h),
          TitleTextWidget(
            text: value,
            textType: TextType.small,
            fontWeight: FontWeight.w700,
            color: kcLightPrimaryText,
          ),
          if (change != 0) ...[
            UIHelper.verticalSpaceXXSmall,
            Row(
              children: [
                Icon(
                  change > 0 ? Icons.trending_up : Icons.trending_down,
                  size: 14.r,
                  color: change > 0 ? kcSuccessColor : kcErrorColor,
                ),
                SizedBox(width: 4.w),
                BodyTextWidget(
                  text: isMonetary
                      ? '${formatPrice(change.abs())} vs yesterday'
                      : '${change.abs().toInt()} vs yesterday',
                  textType: TextType.xxsmall,
                  color: change > 0 ? kcSuccessColor : kcErrorColor,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
