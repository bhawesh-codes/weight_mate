import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import '../settings_viewmodel.dart';

class VersionInfo extends ViewModelWidget<SettingsViewModel> {
  const VersionInfo();

  @override
  Widget build(BuildContext context, SettingsViewModel viewModel) {
    return Column(
      children: [
        BodyTextWidget(
          text: 'WeightMate ${viewModel.appVersion}',
          color: kcLightSecondaryText,
          textType: TextType.small,
          fontWeight: FontWeight.w400,
        ),
        UIHelper.verticalSpaceXXSmall,
        const BodyTextWidget(
          text: 'Made for modern commerce',
          color: kcLightSecondaryText,
          textType: TextType.small,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }
}
