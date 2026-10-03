import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/base/widgets/text/title_text.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'package:weight_mate/ui/common/currency_helper.dart';
import 'package:weight_mate/ui/views/generate_bill/generate_bill_viewmodel.dart';
import 'package:stacked/stacked.dart';

class Summary extends ViewModelWidget<GenerateBillViewModel> {
  const Summary();

  @override
  Widget build(BuildContext context, GenerateBillViewModel viewModel) {
    final b = viewModel.bill;
    return Container(
      margin: EdgeInsets.fromLTRB(24.w, 20.h, 24.w, 0),
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: kcLightSurfaceVariant,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BodyTextWidget(
                text: 'Total Items',
                textType: TextType.small,
                color: kcLightSecondaryText,
              ),
              TitleTextWidget(
                text: '${b.itemCount}',
                textType: TextType.small,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          UIHelper.verticalSpace(12.h),
          Container(
            padding: EdgeInsets.only(top: 12.h),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: kcLightBorder.withValues(alpha: 0.5),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleTextWidget(
                  text: 'Grand Total',
                  textType: TextType.small,
                  color: kcPrimaryColor,
                  fontWeight: FontWeight.w700,
                ),
                TitleTextWidget(
                  text: '$currencySymbol ${b.grandTotal.toStringAsFixed(2)}',
                  textType: TextType.medium,
                  color: kcPrimaryColor,
                  fontWeight: FontWeight.w800,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
