import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/ui/common/app_colors.dart';

class HomeCard extends StatelessWidget {
  final IconData icon;
  final Color bgColor;
  final Color iconColor;
  final String title;
  final String? subtitle;
  final Color titleColor;
  final VoidCallback? onTap;
  const HomeCard({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    required this.bgColor,
    required this.iconColor,
    required this.titleColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: kcLightBorder)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor, size: 32.r),
            UIHelper.verticalSpaceXSmall,
            BodyTextWidget(
              text: title,
              color: titleColor,
              textType: TextType.xsmall,
              fontWeight: FontWeight.w600,
            ),
            if (subtitle != null)
              Padding(
                padding: EdgeInsets.only(top: 2.h),
                child: BodyTextWidget(
                  text: subtitle!,
                  color: titleColor.withValues(alpha: 0.7),
                  textType: TextType.xxsmall,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
