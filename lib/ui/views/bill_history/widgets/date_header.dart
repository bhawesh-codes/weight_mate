import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/widgets/text/title_text.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'shared.dart';

class DateHeader extends StatelessWidget {
  final DateGroupKey dateKey;

  const DateHeader({super.key, required this.dateKey});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        children: [
          TitleTextWidget(
            text: dateKey.label,
            textType: TextType.xxsmall,
            fontWeight: FontWeight.w700,
            color: kcLightSecondaryText,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Container(height: 1, color: kcLightBorder),
          ),
        ],
      ),
    );
  }
}
