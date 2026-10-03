import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/base/widgets/text/title_text.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'package:weight_mate/ui/views/saved_products/saved_products_viewmodel.dart';

class EmptyState extends ViewModelWidget<SavedProductsViewModel> {
  const EmptyState();

  @override
  Widget build(BuildContext context, SavedProductsViewModel viewModel) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.inventory_2_outlined,
                size: 80.r, color: kcLightSecondaryText),
            UIHelper.verticalSpaceMedium,
            TitleTextWidget(
              text: 'No products found',
              textType: TextType.medium,
              fontWeight: FontWeight.w600,
            ),
            UIHelper.verticalSpace(8.h),
            BodyTextWidget(
              text:
                  'Your product list is currently empty.\nStart adding items to speed up your billing process.',
              textType: TextType.small,
              color: kcLightSecondaryText,
              textAlign: TextAlign.center,
            ),
            UIHelper.verticalSpace(24.h),
            ElevatedButton(
              onPressed: viewModel.openAddProduct,
              style: ElevatedButton.styleFrom(
                backgroundColor: kcPrimaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28.r),
                ),
                padding:
                    EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.add, size: 20),
                  UIHelper.horizontalSpaceSmall,
                  BodyTextWidget(
                    text: 'Add Your First Product',
                    textType: TextType.small,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
