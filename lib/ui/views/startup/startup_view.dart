import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/base/utils/app_assets.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/base/widgets/scaffold/base_app_scaffold.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/base/widgets/text/title_text.dart';
import 'package:weight_mate/ui/common/app_colors.dart';

import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return BaseAppScaffold(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: kcPrimaryColor,
      scaffoldBackgroundColor: kcPrimaryColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              AppAssets.splashLogo,
              height: 140.h,
              width: 140.w,
            ),
            UIHelper.verticalSpaceLarge,
            const TitleTextWidget(
              text: 'WeightMate',
              textType: TextType.xxlarge,
              fontWeight: FontWeight.w500,
            ),
            UIHelper.verticalSpaceXSmall,
            const BodyTextWidget(
              text: 'Weight Price Calculator & Bills',
              textType: TextType.smedium,
              color: kcDarkSecondaryText,
            )
          ],
        ),
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(BuildContext context) => StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
