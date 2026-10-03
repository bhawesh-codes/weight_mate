import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/ui/common/app_colors.dart';

class InputField extends StatelessWidget {
  final String label;
  final String? hint;
  final String? prefix;
  final Widget? suffix;
  final String value;
  final ValueChanged<String> onChanged;

  const InputField({
    required this.label,
    this.hint,
    this.prefix,
    this.suffix,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BodyTextWidget(
          text: label,
          textType: TextType.xxsmall,
          color: kcLightSecondaryText,
        ),
        UIHelper.verticalSpace(4.h),
        Container(
          decoration: BoxDecoration(
            color: kcLightSurfaceVariant,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            children: [
              if (prefix != null)
                Padding(
                  padding: EdgeInsets.only(left: 12.w),
                  child: BodyTextWidget(
                    text: prefix!,
                    textType: TextType.xsmall,
                    color: kcLightSecondaryText,
                  ),
                ),
              Expanded(
                child: TextField(
                  controller: TextEditingController.fromValue(
                    TextEditingValue(
                      text: value,
                      selection: TextSelection.collapsed(offset: value.length),
                    ),
                  ),
                  onChanged: onChanged,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12.sp,
                      color: kcLightHintText,
                    ),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: prefix != null ? 4.w : 12.w,
                      vertical: 10,
                    ),
                  ),
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: kcLightPrimaryText,
                  ),
                ),
              ),
              if (suffix != null) suffix!,
            ],
          ),
        ),
      ],
    );
  }
}
