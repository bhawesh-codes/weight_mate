import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/base/widgets/scaffold/base_app_scaffold.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/base/widgets/text/title_text.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'package:weight_mate/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return BaseAppScaffold(
      statusBarColor: kcBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleTextWidget(
                        text: 'WeightMate',
                        color: kcPrimaryColor,
                        textType: TextType.large,
                      ),
                      BodyTextWidget(
                        text: 'Welcome 👋',
                        textType: TextType.smedium,
                      )
                    ],
                  )
                ],
              ),
              verticalSpaceLarge,
              GridView.count(
                  mainAxisSpacing: 12.h,
                  crossAxisSpacing: 12.w,
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  children: [
                    HomeCard(
                      icon: Icons.calculate_outlined,
                      title: 'Quick',
                      subtitle: 'Calculator',
                      bgColor: kcPrimaryColor,
                      iconColor: kcLightCard,
                      titleColor: kcDarkPrimaryText,
                      onTap: viewModel.openQuickCalculator,
                    ),
                    HomeCard(
                      icon: Icons.receipt_long,
                      title: 'Create',
                      subtitle: 'Bills',
                      bgColor: kcAccentColor,
                      iconColor: kcLightCard,
                      titleColor: kcDarkPrimaryText,
                      onTap: viewModel.openCreateBills,
                    ),
                    HomeCard(
                      icon: Icons.inventory_2_outlined,
                      title: 'Products',
                      bgColor: kcLightCard,
                      iconColor: kcPrimaryColor,
                      titleColor: kcLightPrimaryText,
                      onTap: viewModel.openProducts,
                    ),
                    HomeCard(
                      icon: Icons.history,
                      title: 'Bill History',
                      bgColor: kcLightCard,
                      iconColor: kcPrimaryColor,
                      titleColor: kcLightPrimaryText,
                      onTap: viewModel.openBillHistory,
                    ),
                    HomeCard(
                      icon: Icons.qr_code_2_outlined,
                      title: 'Upload QR',
                      bgColor: kcLightCard,
                      iconColor: kcPrimaryColor,
                      titleColor: kcLightPrimaryText,
                      onTap: viewModel.openUploadQr,
                    ),
                    HomeCard(
                      icon: Icons.settings,
                      title: 'Settings',
                      bgColor: kcLightCard,
                      iconColor: kcPrimaryColor,
                      titleColor: kcLightPrimaryText,
                      onTap: viewModel.openSettings,
                    )
                  ])
            ],
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}

class HomeCard extends StatelessWidget {
  final IconData icon;
  final Color bgColor;
  final Color iconColor;
  final String title;
  final String? subtitle;
  final Color titleColor;
  final VoidCallback? onTap;
  const HomeCard({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    required this.bgColor,
    required this.iconColor,
    required this.titleColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 112.h,
        width: 118.w,
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: kcLightBorder)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: iconColor,
              size: 36.r,
            ),
            UIHelper.verticalSpaceXSmall,
            BodyTextWidget(
              text: title,
              color: titleColor,
            ),
            if (subtitle != null)
              BodyTextWidget(
                text: subtitle!,
                color: kcDarkPrimaryText,
              )
          ],
        ),
      ),
    );
  }
}
