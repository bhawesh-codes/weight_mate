import 'package:flutter/material.dart' hide BottomSheet;
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/base/widgets/text/title_text.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'quick_calculator_viewmodel.dart';
import 'widgets/calculator_item_list.dart';
import 'widgets/bottom_sheet.dart';
import 'widgets/clear_confirm_dialog.dart';

class QuickCalculatorView extends StackedView<QuickCalculatorViewModel> {
  const QuickCalculatorView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, QuickCalculatorViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        surfaceTintColor: Colors.white,
        titleSpacing: 0,
        title: Row(
          children: [
            UIHelper.horizontalSpaceMedium,
            Icon(Icons.calculate, color: kcPrimaryColor, size: 28.r),
            UIHelper.horizontalSpaceSmall,
            const TitleTextWidget(
              text: 'Quick Calculator',
              color: kcPrimaryColor,
              textType: TextType.medium,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () => showClearConfirmDialog(context, viewModel),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8.w),
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: kcLightSurfaceVariant,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.delete_sweep, size: 18.r, color: kcErrorColor),
                  SizedBox(width: 4.w),
                  const BodyTextWidget(
                    text: 'Clear All',
                    textType: TextType.small,
                    color: kcErrorColor,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
          ),
          UIHelper.horizontalSpaceSmall,
        ],
      ),
      body: CalculatorItemList(viewModel: viewModel),
      bottomSheet: const BottomSheet(),
    );
  }

  @override
  QuickCalculatorViewModel viewModelBuilder(BuildContext context) =>
      QuickCalculatorViewModel();
}
