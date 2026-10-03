import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/widgets/text/title_text.dart';
import 'package:weight_mate/ui/common/app_colors.dart';

class TopBar extends StatelessWidget {
  final VoidCallback onBack;
  const TopBar({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: onBack,
            child: Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: kcPrimaryContainer,
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Icon(Icons.arrow_back, color: kcPrimaryColor, size: 24.r),
            ),
          ),
          SizedBox(width: 12.w),
          const TitleTextWidget(
            text: 'QR Payment Setup',
            color: kcPrimaryColor,
            textType: TextType.medium,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
