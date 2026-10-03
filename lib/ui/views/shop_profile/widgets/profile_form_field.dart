import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:weight_mate/ui/common/app_colors.dart';

class ProfileFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData prefixIcon;
  final TextInputType? keyboardType;

  const ProfileFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kcLightSurfaceVariant,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: kcLightBorder.withValues(alpha: 0.5)),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontFamily: 'Inter',
            fontSize: 16.sp,
            color: kcLightHintText,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: Icon(prefixIcon, color: kcPrimaryColor, size: 22.r),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        ),
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 16.sp,
          color: kcLightPrimaryText,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
