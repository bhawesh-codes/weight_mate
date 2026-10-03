import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/base/widgets/text/title_text.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import '../settings_viewmodel.dart';

class ProfileSection extends ViewModelWidget<SettingsViewModel> {
  const ProfileSection();

  @override
  Widget build(BuildContext context, SettingsViewModel viewModel) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: kcLightBorder.withValues(alpha: 0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 64.w,
            height: 64.h,
            decoration: BoxDecoration(
              color: kcPrimaryContainer,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Icon(Icons.storefront, color: kcPrimaryColor, size: 32.r),
          ),
          UIHelper.horizontalSpaceMedium,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleTextWidget(
                  text: viewModel.storeName,
                  color: kcLightPrimaryText,
                  textType: TextType.smedium,
                  fontWeight: FontWeight.w600,
                ),
                UIHelper.verticalSpaceXXSmall,
                BodyTextWidget(
                  text: viewModel.storeAddress,
                  color: kcLightSecondaryText,
                  textType: TextType.small,
                ),
                UIHelper.verticalSpaceXXSmall,
                BodyTextWidget(
                  text: viewModel.storePhone,
                  color: kcLightSecondaryText,
                  textType: TextType.small,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: viewModel.openShopProfile,
            child: Icon(Icons.edit_outlined, color: kcLightSecondaryText, size: 20.r),
          ),
        ],
      ),
    );
  }
}
