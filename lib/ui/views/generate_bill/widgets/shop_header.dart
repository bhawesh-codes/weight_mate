import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/base/widgets/text/title_text.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'package:weight_mate/ui/views/generate_bill/generate_bill_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ShopHeader extends ViewModelWidget<GenerateBillViewModel> {
  const ShopHeader();

  @override
  Widget build(BuildContext context, GenerateBillViewModel viewModel) {
    final b = viewModel.bill;
    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 16.h),
      child: Column(
        children: [
          TitleTextWidget(
            text: b.shopName,
            textType: TextType.medium,
            fontWeight: FontWeight.w700,
            color: kcPrimaryColor,
          ),
          UIHelper.verticalSpace(4.h),
          BodyTextWidget(
            text: b.shopAddress,
            textType: TextType.small,
            color: kcLightSecondaryText,
          ),
          UIHelper.verticalSpaceXXSmall,
          BodyTextWidget(
            text: b.shopPhone,
            textType: TextType.xsmall,
            color: kcLightSecondaryText,
          ),
        ],
      ),
    );
  }
}
