import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/base/widgets/scaffold/base_app_scaffold.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/base/widgets/text/title_text.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'scan_pay_viewmodel.dart';

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
            _TopBar(onBack: viewModel.onBack),
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
                      '₹ ${viewModel.grandTotal.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 40.sp,
                        fontWeight: FontWeight.w700,
                        color: kcPrimaryColor,
                        letterSpacing: -0.02,
                      ),
                    ),
                    UIHelper.verticalSpace(8.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        color: kcPrimaryContainer,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: BodyTextWidget(
                        text: viewModel.storeName,
                        textType: TextType.xsmall,
                        color: kcPrimaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    UIHelper.verticalSpaceXLarge,
                    if (viewModel.hasQrCode)
                      Container(
                        padding: EdgeInsets.all(16.r),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(color: kcPrimaryColor.withValues(alpha: 0.2), width: 2),
                          boxShadow: [
                            BoxShadow(
                              color: kcPrimaryColor.withValues(alpha: 0.08),
                              blurRadius: 24,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.r),
                          child: Image.file(
                            File(viewModel.qrCodePath!),
                            width: 260.w,
                            height: 260.h,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) =>
                                _buildNoQrPlaceholder(),
                          ),
                        ),
                      )
                    else
                      _buildNoQrPlaceholderLarge(),
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

  Widget _buildNoQrPlaceholder() {
    return Container(
      width: 260.w,
      height: 260.h,
      decoration: BoxDecoration(
        color: kcLightSurfaceVariant,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Icon(Icons.qr_code_2_outlined, size: 80.r, color: kcLightHintText),
    );
  }

  Widget _buildNoQrPlaceholderLarge() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 60.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: kcLightBorder.withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          Icon(Icons.qr_code_2_outlined, size: 80.r, color: kcLightHintText),
          UIHelper.verticalSpaceMedium,
          const BodyTextWidget(
            text: 'No Payment QR Set Up',
            textType: TextType.smedium,
            color: kcLightSecondaryText,
            fontWeight: FontWeight.w500,
          ),
          UIHelper.verticalSpace(4.h),
          const BodyTextWidget(
            text: 'Please upload a QR code in Settings',
            textType: TextType.small,
            color: kcLightSecondaryText,
          ),
        ],
      ),
    );
  }

  @override
  ScanPayViewModel viewModelBuilder(BuildContext context) =>
      ScanPayViewModel(grandTotal: grandTotal);
}

class _TopBar extends StatelessWidget {
  final VoidCallback onBack;
  const _TopBar({required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: onBack,
            child: Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: kcPrimaryContainer,
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Icon(Icons.arrow_back, color: kcPrimaryColor, size: 24.r),
            ),
          ),
          SizedBox(width: 12.w),
          const TitleTextWidget(
            text: 'Scan & Pay',
            color: kcPrimaryColor,
            textType: TextType.medium,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
