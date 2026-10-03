import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/base/widgets/text/title_text.dart';
import 'package:weight_mate/ui/common/app_colors.dart';

class FieldWidget extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  final TextEditingController controller;
  final String? error;

  const FieldWidget({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
    required this.controller,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleTextWidget(
          text: label,
          textType: TextType.small,
          fontWeight: FontWeight.w600,
        ),
        UIHelper.verticalSpace(8.h),
        Container(
          height: 64.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: error != null ? kcErrorColor : kcLightBorder,
            ),
          ),
          child: Row(
            children: [
              UIHelper.horizontalSpaceMedium,
              Icon(icon, color: kcLightSecondaryText, size: 20.r),
              SizedBox(width: 12.w),
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14.sp,
                      color: kcLightHintText,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                  ),
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16.sp,
                    color: kcLightPrimaryText,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (error != null)
          Padding(
            padding: EdgeInsets.only(top: 4.h, left: 4.w),
            child: BodyTextWidget(
              text: error!,
              textType: TextType.xsmall,
              color: kcErrorColor,
            ),
          ),
      ],
    );
  }
}
