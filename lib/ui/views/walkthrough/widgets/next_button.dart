import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'package:weight_mate/ui/views/walkthrough/walkthrough_viewmodel.dart';

class WalkthroughNextButton extends ViewModelWidget<WalkthroughViewModel> {
  const WalkthroughNextButton();

  @override
  Widget build(BuildContext context, WalkthroughViewModel viewModel) {
    return SizedBox(
      height: 36.h,
      width: 100.w,
      child: ElevatedButton(
        onPressed: viewModel.onButtonTap,
        child: const BodyTextWidget(
          text: 'Next',
          textType: TextType.smedium,
          color: kcDarkPrimaryText,
        ),
      ),
    );
  }
}
