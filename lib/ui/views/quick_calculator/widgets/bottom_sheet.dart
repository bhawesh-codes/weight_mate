import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'package:weight_mate/ui/views/quick_calculator/quick_calculator_viewmodel.dart';
import 'grand_total_label.dart';
import 'add_item_button.dart';
import 'action_buttons_row.dart';

class BottomSheet extends ViewModelWidget<QuickCalculatorViewModel> {
  const BottomSheet({super.key});

  @override
  Widget build(BuildContext context, QuickCalculatorViewModel viewModel) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.r),
          topRight: Radius.circular(32.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 24,
            offset: const Offset(0, -8),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 8.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GrandTotalLabel(grandTotal: viewModel.grandTotal),

              UIHelper.verticalSpace(12.h),
              AddItemButton(onPressed: viewModel.addRow),
              UIHelper.verticalSpace(12.h),
              ActionButtonsRow(
                onSave: () async {
                  await viewModel.saveToHistory();
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Saved to history'),
                        backgroundColor: kcSuccessColor,
                        behavior: SnackBarBehavior.floating,
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  }
                },
                onQr: viewModel.showQr,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
