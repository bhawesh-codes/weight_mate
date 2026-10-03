import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/base/widgets/scaffold/base_app_scaffold.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'package:weight_mate/ui/common/currency_helper.dart';
import 'scan_pay_viewmodel.dart';
import 'widgets/qr_display_card.dart';
import 'widgets/store_badge.dart';
import 'widgets/top_bar.dart';

class ScanPayView extends StackedView<ScanPayViewModel> {
  final double grandTotal;

  const ScanPayView({Key? key, required this.grandTotal}) : super(key: key);

  @override
  Widget builder(BuildContext context, ScanPayViewModel viewModel, Widget? child) {
    return BaseAppScaffold(
      statusBarColor: kcBackgroundColor,
      statusBarIconBrightness: Brightness.dark,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(onBack: viewModel.onBack),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    UIHelper.verticalSpaceXLarge,
                    const BodyTextWidget(
                      text: 'Total to Pay',
                      textType: TextType.smedium,
                      color: kcLightSecondaryText,
                      fontWeight: FontWeight.w500,
                    ),
                    UIHelper.verticalSpace(8.h),
                    Text(
                      '$currencySymbol ${viewModel.grandTotal.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 40.sp,
                        fontWeight: FontWeight.w700,
                        color: kcPrimaryColor,
                        letterSpacing: -0.02,
                      ),
                    ),
                    UIHelper.verticalSpace(8.h),
                    StoreBadge(storeName: viewModel.storeName),
                    UIHelper.verticalSpaceXLarge,
                    QrDisplayCard(viewModel: viewModel),
                    UIHelper.verticalSpace(24.h),
                    const BodyTextWidget(
                      text: 'Scan this QR code to make payment',
                      textType: TextType.small,
                      color: kcLightSecondaryText,
                    ),
                    UIHelper.verticalSpace(40.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ScanPayViewModel viewModelBuilder(BuildContext context) =>
      ScanPayViewModel(grandTotal: grandTotal);
}
