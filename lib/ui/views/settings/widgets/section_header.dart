import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/ui/common/app_colors.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.w),
      child: BodyTextWidget(
        text: title,
        color: kcPrimaryColor,
        textType: TextType.xsmall,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
