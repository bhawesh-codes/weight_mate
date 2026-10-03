import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/base/widgets/text/title_text.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'package:weight_mate/ui/common/currency_helper.dart';
import 'package:weight_mate/ui/views/add_product/add_product_viewmodel.dart';
import 'unit_selector.dart';

class PriceField extends ViewModelWidget<AddProductViewModel> {
  const PriceField();

  @override
  Widget build(BuildContext context, AddProductViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleTextWidget(
          text: 'Price',
          textType: TextType.small,
          fontWeight: FontWeight.w600,
        ),
        UIHelper.verticalSpace(8.h),
        Container(
          height: 64.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: viewModel.priceError != null ? kcErrorColor : kcLightBorder,
            ),
          ),
          child: Row(
            children: [
              UIHelper.horizontalSpaceMedium,
              TitleTextWidget(
                text: currencySymbol,
                textType: TextType.medium,
                fontWeight: FontWeight.w600,
                color: kcLightSecondaryText,
              ),
              UIHelper.horizontalSpaceSmall,
              Expanded(
                child: TextField(
                  controller: viewModel.priceController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    hintText: '0.00',
                    hintStyle: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14.sp,
                      color: kcLightHintText,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                  ),
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: kcLightPrimaryText,
                  ),
                ),
              ),
              UIHelper.horizontalSpaceSmall,
              const UnitSelector(),
              UIHelper.horizontalSpaceSmall,
            ],
          ),
        ),
        if (viewModel.priceError != null)
          Padding(
            padding: EdgeInsets.only(top: 4.h, left: 4.w),
            child: BodyTextWidget(
              text: viewModel.priceError!,
              textType: TextType.xsmall,
              color: kcErrorColor,
            ),
          ),
      ],
    );
  }
}
