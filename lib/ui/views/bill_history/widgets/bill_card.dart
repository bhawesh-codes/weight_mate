import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/base/widgets/text/title_text.dart';
import 'package:weight_mate/models/bill_record.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'package:weight_mate/ui/common/currency_helper.dart';
import '../bill_history_viewmodel.dart';
import 'shared.dart';

class BillCard extends ViewModelWidget<BillHistoryViewModel> {
  final BillRecord bill;

  const BillCard({super.key, required this.bill});

  @override
  Widget build(BuildContext context, BillHistoryViewModel viewModel) {
    final timeStr = formatTime(bill.createdAt);
    return GestureDetector(
      onTap: () => viewModel.onBillTap(bill),
      child: Container(
        margin: EdgeInsets.only(bottom: 8.h),
        padding: EdgeInsets.all(14.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: kcLightBorder),
        ),
        child: Row(
          children: [
            Container(
              width: 44.w,
              height: 44.w,
              decoration: const BoxDecoration(
                color: kcPrimaryContainer,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.receipt_long,
                color: kcPrimaryColor,
                size: 22.r,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleTextWidget(
                    text: '#${bill.billNumber}',
                    textType: TextType.small,
                    fontWeight: FontWeight.w700,
                  ),
                  UIHelper.verticalSpaceXXSmall,
                  BodyTextWidget(
                    text: '$timeStr • ${bill.itemCount} items',
                    textType: TextType.xsmall,
                    color: kcLightSecondaryText,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TitleTextWidget(
                  text: formatPrice(bill.grandTotal),
                  textType: TextType.small,
                  fontWeight: FontWeight.w700,
                  color: kcPrimaryColor,
                ),
                SizedBox(width: 4.w),
                Icon(Icons.chevron_right, color: kcLightBorder, size: 18.r),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
