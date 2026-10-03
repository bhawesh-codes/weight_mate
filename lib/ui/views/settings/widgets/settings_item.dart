import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/ui/common/app_colors.dart';

class SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;

  const SettingsItem({
    required this.icon,
    required this.title,
    this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.r),
          bottom: Radius.circular(16.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Row(
            children: [
              Icon(icon, color: kcLightSecondaryText, size: 24.r),
              UIHelper.horizontalSpaceMedium,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BodyTextWidget(
                      text: title,
                      color: kcLightPrimaryText,
                      textType: TextType.medium,
                      fontWeight: FontWeight.w400,
                    ),
                    if (subtitle != null) ...[
                      UIHelper.verticalSpaceXXSmall,
                      BodyTextWidget(
                        text: subtitle!,
                        color: kcLightSecondaryText,
                        textType: TextType.small,
                      ),
                    ],
                  ],
                ),
              ),
              Icon(Icons.chevron_right, color: kcLightSecondaryText.withValues(alpha: 0.5), size: 20.r),
            ],
          ),
        ),
      ),
    );
  }
}
