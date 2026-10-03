import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/base/widgets/text/title_text.dart';
import 'package:weight_mate/ui/common/app_colors.dart';

import '../home_viewmodel.dart';

class Header extends ViewModelWidget<HomeViewModel> {
  const Header();

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 56.w,
          height: 56.w,
          decoration: BoxDecoration(
            color: kcPrimaryContainer,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Icon(Icons.storefront, color: kcPrimaryColor, size: 30.r),
        ),
        SizedBox(width: 14.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BodyTextWidget(
                text: viewModel.greeting,
                textType: TextType.small,
                color: kcLightHintText,
                fontWeight: FontWeight.w500,
              ),
              UIHelper.verticalSpaceXXSmall,
              Row(
                children: [
                  Flexible(
                    child: TitleTextWidget(
                      text: viewModel.displayName,
                      textType: TextType.large,
                      fontWeight: FontWeight.w700,
                      color: kcLightPrimaryText,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (viewModel.isStoreDefault) ...[
                    SizedBox(width: 4.w),
                    GestureDetector(
                      onTap: viewModel.openShopProfile,
                      child:
                          Icon(Icons.edit, size: 16.r, color: kcPrimaryColor),
                    ),
                  ],
                ],
              ),
              UIHelper.verticalSpaceXXSmall,
              Row(
                children: [
                  Icon(Icons.location_on_outlined,
                      size: 14.r, color: kcLightSecondaryText),
                  SizedBox(width: 2.w),
                  Flexible(
                    child: BodyTextWidget(
                      text: viewModel.displayAddress,
                      textType: TextType.xsmall,
                      color: kcLightSecondaryText,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (viewModel.isStoreDefault) ...[
                    SizedBox(width: 4.w),
                    GestureDetector(
                      onTap: viewModel.openShopProfile,
                      child:
                          Icon(Icons.edit, size: 12.r, color: kcPrimaryColor),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
        if (!viewModel.isStoreDefault)
          GestureDetector(
            onTap: viewModel.openShopProfile,
            child: Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: kcLightSurfaceVariant,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(Icons.edit_outlined,
                  size: 18.r, color: kcLightSecondaryText),
            ),
          ),
      ],
    );
  }
}
