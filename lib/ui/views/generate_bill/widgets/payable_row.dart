import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/base/widgets/text/title_text.dart';
import 'package:weight_mate/models/bill.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'package:weight_mate/ui/common/currency_helper.dart';
import 'package:weight_mate/ui/views/generate_bill/generate_bill_viewmodel.dart';

class PayableRow extends ViewModelWidget<GenerateBillViewModel> {
  final Bill b;

  const PayableRow({required this.b});

  @override
  Widget build(BuildContext context, GenerateBillViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BodyTextWidget(
              text: 'PAYABLE AMOUNT',
              textType: TextType.xxsmall,
              fontWeight: FontWeight.w700,
              color: kcLightSecondaryText,
            ),
            UIHelper.verticalSpaceXXSmall,
            TitleTextWidget(
              text: '$currencySymbol ${b.grandTotal.toStringAsFixed(2)}',
              textType: TextType.xlarge,
              color: kcPrimaryColor,
              fontWeight: FontWeight.w800,
            ),
          ],
        ),
        SizedBox(
          width: 44.w,
          height: 44.w,
          child: ElevatedButton(
            onPressed: viewModel.showQR,
            style: ElevatedButton.styleFrom(
              backgroundColor: kcPrimaryColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              padding: EdgeInsets.zero,
            ),
            child: Icon(Icons.qr_code_2, size: 24.r),
          ),
        ),
      ],
    );
  }
}
