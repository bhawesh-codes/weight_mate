import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import '../qr_payment_setup_viewmodel.dart';

class QrActionButtons extends StatelessWidget {
  final QrPaymentSetupViewModel viewModel;
  const QrActionButtons({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
    );
  }
}
