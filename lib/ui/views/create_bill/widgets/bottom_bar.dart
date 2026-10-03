import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'package:weight_mate/ui/common/currency_helper.dart';
import 'package:weight_mate/ui/views/create_bill/create_bill_viewmodel.dart';

class BottomBar extends ViewModelWidget<CreateBillViewModel> {
  const BottomBar();

  @override
  Widget build(BuildContext context, CreateBillViewModel viewModel) {
    return Container(
      decoration: BoxDecoration(
        color: kcLightSurfaceVariant,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.r),
          topRight: Radius.circular(32.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 30,
            offset: const Offset(0, -8),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 8.h),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BodyTextWidget(
                      text: 'Total Payable',
                      textType: TextType.xsmall,
                      color: kcLightSecondaryText,
                    ),
                    Text(
                      formatPrice(viewModel.totalPayable),
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w700,
                        color: kcPrimaryColor,
                        letterSpacing: -0.02,
                      ),
                    ),
                  ],
                ),
              ),
              UIHelper.horizontalSpaceMedium,
              Expanded(
                child: SizedBox(
                  height: 56.h,
                  child: ElevatedButton.icon(
                    onPressed: viewModel.generateBill,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kcPrimaryColor,
                      foregroundColor: Colors.white,
                      elevation: 4,
                      shadowColor: kcPrimaryColor.withValues(alpha: 0.2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28.r),
                      ),
                    ),
                    icon: const Icon(Icons.receipt, size: 20),
                    label: const BodyTextWidget(
                      text: 'Generate Bill',
                      textType: TextType.small,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
