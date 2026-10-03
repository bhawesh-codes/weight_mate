import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import '../quick_calculator_viewmodel.dart';

void showClearConfirmDialog(
    BuildContext context, QuickCalculatorViewModel viewModel) {
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      title: const BodyTextWidget(
        text: 'Clear all items?',
        textType: TextType.small,
        fontWeight: FontWeight.w600,
      ),
      content: const BodyTextWidget(
        text: 'This will remove all calculator rows.',
        textType: TextType.xsmall,
        color: kcLightSecondaryText,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(ctx),
          child: const BodyTextWidget(
            text: 'Cancel',
            textType: TextType.small,
            color: kcLightSecondaryText,
          ),
        ),
        TextButton(
          onPressed: () {
            viewModel.clearAll();
            Navigator.pop(ctx);
          },
          child: const BodyTextWidget(
            text: 'Clear',
            textType: TextType.small,
            color: kcErrorColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}
