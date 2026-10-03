import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/base/widgets/text/title_text.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'package:weight_mate/ui/views/generate_bill/generate_bill_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'shared.dart';

class BillMeta extends ViewModelWidget<GenerateBillViewModel> {
  const BillMeta();

  @override
  Widget build(BuildContext context, GenerateBillViewModel viewModel) {
    final b = viewModel.bill;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      padding: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: kcLightBorder.withValues(alpha: 0.5)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BodyTextWidget(
                text: 'Bill Number',
                textType: TextType.xsmall,
                color: kcLightSecondaryText,
              ),
              UIHelper.verticalSpaceXXSmall,
              TitleTextWidget(
                text: '#${b.billNumber}',
                textType: TextType.small,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BodyTextWidget(
                text: 'Date',
                textType: TextType.xsmall,
                color: kcLightSecondaryText,
              ),
              UIHelper.verticalSpaceXXSmall,
              TitleTextWidget(
                text: formatDate(b.createdAt),
                textType: TextType.small,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
