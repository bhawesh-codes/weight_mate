import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import '../scan_pay_viewmodel.dart';
import 'no_qr_placeholder.dart';
import 'no_qr_placeholder_large.dart';

class QrDisplayCard extends StatelessWidget {
  final ScanPayViewModel viewModel;
  const QrDisplayCard({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    if (viewModel.hasQrCode) {
      return Container(
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
                const NoQrPlaceholder(),
          ),
        ),
      );
    }
    return const NoQrPlaceholderLarge();
  }
}
