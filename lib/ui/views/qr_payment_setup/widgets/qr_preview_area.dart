import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import '../qr_payment_setup_viewmodel.dart';

class QrPreviewArea extends StatelessWidget {
  final QrPaymentSetupViewModel viewModel;
  const QrPreviewArea({super.key, required this.viewModel});

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
