import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/base/widgets/scaffold/base_app_scaffold.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'qr_payment_setup_viewmodel.dart';
import 'widgets/qr_action_buttons.dart';
import 'widgets/qr_preview_area.dart';
import 'widgets/section_label.dart';
import 'widgets/top_bar.dart';

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
            TopBar(onBack: viewModel.onBack),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UIHelper.verticalSpaceMedium,
                    const SectionLabel(text: 'Payment QR Code'),
                    UIHelper.verticalSpace(4.h),
                    const BodyTextWidget(
                      text: 'Upload your payment QR code so customers can scan and pay easily.',
                      textType: TextType.small,
                      color: kcLightSecondaryText,
                    ),
                    UIHelper.verticalSpace(24.h),
                    QrPreviewArea(viewModel: viewModel),
                    UIHelper.verticalSpaceXLarge,
                    QrActionButtons(viewModel: viewModel),
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
