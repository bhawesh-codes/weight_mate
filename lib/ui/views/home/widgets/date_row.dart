import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/ui/common/app_colors.dart';

import '../home_viewmodel.dart';

class DateRow extends ViewModelWidget<HomeViewModel> {
  const DateRow();

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Padding(
      padding: EdgeInsets.only(left: 70.w),
      child: BodyTextWidget(
        text: viewModel.todayDate,
        textType: TextType.xsmall,
        color: kcLightHintText,
      ),
    );
  }
}
