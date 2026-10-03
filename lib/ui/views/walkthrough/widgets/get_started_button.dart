import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'package:weight_mate/ui/views/walkthrough/walkthrough_viewmodel.dart';

class WalkthroughGetStartedButton extends ViewModelWidget<WalkthroughViewModel> {
  const WalkthroughGetStartedButton();

  @override
  Widget build(BuildContext context, WalkthroughViewModel viewModel) {
    return SizedBox(
      height: 44.h,
      child: ElevatedButton(
        onPressed: viewModel.onButtonTap,
        child: const BodyTextWidget(
          textType: TextType.medium,
          text: 'Get Started',
          color: kcDarkPrimaryText,
        ),
      ),
    );
  }
}
