import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'package:weight_mate/ui/views/add_product/add_product_viewmodel.dart';

class BottomActions extends ViewModelWidget<AddProductViewModel> {
  const BottomActions();

  @override
  Widget build(BuildContext context, AddProductViewModel viewModel) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 24.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: kcLightBorder)),
      ),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 56.h,
              child: OutlinedButton(
                onPressed: viewModel.cancel,
                style: OutlinedButton.styleFrom(
                  foregroundColor: kcLightSecondaryText,
                  side: BorderSide(color: kcLightBorder),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: const BodyTextWidget(
                  text: 'Cancel',
                  textType: TextType.small,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          UIHelper.horizontalSpaceMedium,
          Expanded(
            child: SizedBox(
              height: 56.h,
              child: ElevatedButton(
                onPressed: viewModel.isBusy ? null : viewModel.validateAndSave,
                style: ElevatedButton.styleFrom(
                  backgroundColor: kcPrimaryColor,
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: kcLightBorder,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: viewModel.isBusy
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : BodyTextWidget(
                        text: viewModel.isEditing ? 'Update Product' : 'Save Product',
                        textType: TextType.small,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
