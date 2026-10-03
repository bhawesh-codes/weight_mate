import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/ui/common/app_colors.dart';

class ActionButtonsRow extends StatelessWidget {
  final VoidCallback onSave;
  final VoidCallback onQr;

  const ActionButtonsRow({
    super.key,
    required this.onSave,
    required this.onQr,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 52.h,
            child: OutlinedButton.icon(
              onPressed: onSave,
              style: OutlinedButton.styleFrom(
                foregroundColor: kcPrimaryColor,
                side: const BorderSide(color: kcPrimaryColor, width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              icon: const Icon(Icons.history, size: 18),
              label: const BodyTextWidget(
                text: 'Save',
                textType: TextType.small,
                color: kcPrimaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: SizedBox(
            height: 52.h,
            child: ElevatedButton.icon(
              onPressed: onQr,
              style: ElevatedButton.styleFrom(
                backgroundColor: kcPrimaryColor,
                foregroundColor: Colors.white,
                elevation: 4,
                shadowColor: kcPrimaryColor.withValues(alpha: 0.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              icon: const Icon(Icons.qr_code_2, size: 18),
              label: const BodyTextWidget(
                text: 'QR',
                textType: TextType.small,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
