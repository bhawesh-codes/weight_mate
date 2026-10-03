import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/models/bill.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/ui/views/generate_bill/generate_bill_viewmodel.dart';
import 'action_grid.dart';
import 'done_button.dart';
import 'payable_row.dart';

class BottomSheet extends ViewModelWidget<GenerateBillViewModel> {
  final Bill b;

  const BottomSheet({required this.b});

  @override
  Widget build(BuildContext context, GenerateBillViewModel viewModel) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 30,
            offset: const Offset(0, -8),
          ),
        ],
      ),
      padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 16.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PayableRow(b: b),
          UIHelper.verticalSpace(8.h),
          const ActionGrid(),
          UIHelper.verticalSpace(8.h),
          const DoneButton(),
        ],
      ),
    );
  }
}
