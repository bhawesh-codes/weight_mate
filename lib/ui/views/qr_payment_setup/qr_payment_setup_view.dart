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
import 'qr_payment_setup_viewmodel.dart';

class QrPaymentSetupView extends StackedView<QrPaymentSetupViewModel> {
  const QrPaymentSetupView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, QrPaymentSetupViewModel viewModel, Widget? child) {
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UIHelper.verticalSpaceMedium,
                    const _SectionLabel(text: 'Payment QR Code'),
                    UIHelper.verticalSpace(4.h),
                    const BodyTextWidget(
                      text: 'Upload your payment QR code so customers can scan and pay easily.',
                      textType: TextType.small,
                      color: kcLightSecondaryText,
                    ),
                    UIHelper.verticalSpace(24.h),
                    _QrPreviewArea(viewModel: viewModel),
                    UIHelper.verticalSpaceXLarge,
                    if (viewModel.hasQrCode)
                      SizedBox(
                        width: double.infinity,
                        height: 56.h,
                        child: OutlinedButton.icon(
                          onPressed: viewModel.pickFromGallery,
                          style: OutlinedButton.styleFrom(
                            foregroundColor: kcPrimaryColor,
                            side: const BorderSide(color: kcPrimaryColor, width: 1.5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                          ),
                          icon: const Icon(Icons.swap_horiz, size: 20),
                          label: const BodyTextWidget(
                            text: 'Change QR Code',
                            textType: TextType.medium,
                            color: kcPrimaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    else
                      SizedBox(
                        width: double.infinity,
                        height: 56.h,
                        child: ElevatedButton.icon(
                          onPressed: viewModel.pickFromGallery,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kcPrimaryColor,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                          ),
                          icon: const Icon(Icons.camera_alt_outlined, size: 20),
                          label: const BodyTextWidget(
                            text: 'Upload QR Code',
                            textType: TextType.medium,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    if (viewModel.hasQrCode) ...[
                      UIHelper.verticalSpace(12.h),
                      SizedBox(
                        width: double.infinity,
                        height: 56.h,
                        child: OutlinedButton.icon(
                          onPressed: viewModel.removeQr,
                          style: OutlinedButton.styleFrom(
                            foregroundColor: kcErrorColor,
                            side: BorderSide(color: kcErrorColor.withValues(alpha: 0.3), width: 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                          ),
                          icon: const Icon(Icons.delete_outline, size: 20),
                          label: const BodyTextWidget(
                            text: 'Remove QR Code',
                            textType: TextType.medium,
                            color: kcErrorColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
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
  QrPaymentSetupViewModel viewModelBuilder(BuildContext context) =>
      QrPaymentSetupViewModel();
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
            text: 'QR Payment Setup',
            color: kcPrimaryColor,
            textType: TextType.medium,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    return BodyTextWidget(
      text: text,
      color: kcLightPrimaryText,
      textType: TextType.smedium,
      fontWeight: FontWeight.w600,
    );
  }
}

class _QrPreviewArea extends StatelessWidget {
  final QrPaymentSetupViewModel viewModel;
  const _QrPreviewArea({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: viewModel.hasQrCode
              ? kcPrimaryColor.withValues(alpha: 0.3)
              : kcLightBorder.withValues(alpha: 0.5),
          width: viewModel.hasQrCode ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          if (viewModel.hasQrCode)
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.file(
                File(viewModel.qrCodePath!),
                width: 220.w,
                height: 220.h,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) =>
                    _buildPlaceholderIcon(),
              ),
            )
          else
            _buildPlaceholderIcon(),
          UIHelper.verticalSpaceMedium,
          BodyTextWidget(
            text: viewModel.hasQrCode ? 'QR Code Ready' : 'No QR Code Uploaded',
            textType: TextType.smedium,
            color: viewModel.hasQrCode ? kcPrimaryColor : kcLightSecondaryText,
            fontWeight: FontWeight.w600,
          ),
          UIHelper.verticalSpace(4.h),
          BodyTextWidget(
            text: viewModel.hasQrCode
                ? 'Customers can scan this code to pay'
                : 'Upload your UPI / payment QR code',
            textType: TextType.small,
            color: kcLightSecondaryText,
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholderIcon() {
    return Container(
      width: 220.w,
      height: 220.h,
      decoration: BoxDecoration(
        color: kcLightSurfaceVariant,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Icon(
        Icons.qr_code_2_outlined,
        size: 80.r,
        color: kcLightHintText,
      ),
    );
  }
}
