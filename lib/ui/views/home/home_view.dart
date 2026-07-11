import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/base/widgets/scaffold/base_app_scaffold.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/base/widgets/text/title_text.dart';
import 'package:weight_mate/ui/common/app_colors.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    viewModel.init();
  }

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return BaseAppScaffold(
      scaffoldBackgroundColor: kcBackgroundColor,
      statusBarColor: kcBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding:
                    EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(viewModel),
                    UIHelper.verticalSpace(4.h),
                    _buildDateRow(viewModel),
                    UIHelper.verticalSpace(28.h),
                    GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      mainAxisSpacing: 12.h,
                      crossAxisSpacing: 12.w,
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      childAspectRatio: 1.1,
                      children: [
                        HomeCard(
                          icon: Icons.calculate_outlined,
                          title: 'Quick Calculator',
                          subtitle: 'Calculate prices instantly',
                          bgColor: kcPrimaryColor,
                          iconColor: kcLightCard,
                          titleColor: kcDarkPrimaryText,
                          onTap: viewModel.openQuickCalculator,
                        ),
                        HomeCard(
                          icon: Icons.receipt_long,
                          title: 'Create Bill',
                          subtitle: 'Generate new invoices',
                          bgColor: kcAccentColor,
                          iconColor: kcLightCard,
                          titleColor: kcDarkPrimaryText,
                          onTap: viewModel.openCreateBills,
                        ),
                        HomeCard(
                          icon: Icons.inventory_2_outlined,
                          title: 'Products',
                          subtitle: 'Manage saved items',
                          bgColor: kcLightCard,
                          iconColor: kcPrimaryColor,
                          titleColor: kcLightPrimaryText,
                          onTap: viewModel.openProducts,
                        ),
                        HomeCard(
                          icon: Icons.history,
                          title: 'Bill History',
                          subtitle: 'View past transactions',
                          bgColor: kcLightCard,
                          iconColor: kcPrimaryColor,
                          titleColor: kcLightPrimaryText,
                          onTap: viewModel.openBillHistory,
                        ),
                        HomeCard(
                          icon: Icons.qr_code_2_outlined,
                          title: 'Upload QR',
                          subtitle: 'Set up payment QR',
                          bgColor: kcLightCard,
                          iconColor: kcPrimaryColor,
                          titleColor: kcLightPrimaryText,
                          onTap: viewModel.openUploadQr,
                        ),
                        HomeCard(
                          icon: Icons.settings,
                          title: 'Settings',
                          subtitle: 'Store & app preferences',
                          bgColor: kcLightCard,
                          iconColor: kcPrimaryColor,
                          titleColor: kcLightPrimaryText,
                          onTap: viewModel.openSettings,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            _buildStatsRow(viewModel),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsRow(HomeViewModel viewModel) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: kcLightBorder)),
      ),
      child: Row(
        children: [
          Expanded(
            child: _HomeStatCard(
              icon: Icons.currency_rupee,
              label: "Today's Revenue",
              value: '₹${viewModel.todayRevenue.toStringAsFixed(2)}',
              change: viewModel.revenueChange,
              isMonetary: true,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: _HomeStatCard(
              icon: Icons.receipt,
              label: "Today's Bills",
              value: '${viewModel.todayBillCount} Bills',
              change: viewModel.billCountChange.toDouble(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(HomeViewModel viewModel) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 56.w,
          height: 56.w,
          decoration: BoxDecoration(
            color: kcPrimaryContainer,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Icon(Icons.storefront, color: kcPrimaryColor, size: 30.r),
        ),
        SizedBox(width: 14.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BodyTextWidget(
                text: viewModel.greeting,
                textType: TextType.small,
                color: kcLightHintText,
                fontWeight: FontWeight.w500,
              ),
              UIHelper.verticalSpaceXXSmall,
              Row(
                children: [
                  Flexible(
                    child: TitleTextWidget(
                      text: viewModel.displayName,
                      textType: TextType.large,
                      fontWeight: FontWeight.w700,
                      color: kcLightPrimaryText,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (viewModel.isStoreDefault) ...[
                    SizedBox(width: 4.w),
                    GestureDetector(
                      onTap: viewModel.openShopProfile,
                      child:
                          Icon(Icons.edit, size: 16.r, color: kcPrimaryColor),
                    ),
                  ],
                ],
              ),
              UIHelper.verticalSpaceXXSmall,
              Row(
                children: [
                  Icon(Icons.location_on_outlined,
                      size: 14.r, color: kcLightSecondaryText),
                  SizedBox(width: 2.w),
                  Flexible(
                    child: BodyTextWidget(
                      text: viewModel.displayAddress,
                      textType: TextType.xsmall,
                      color: kcLightSecondaryText,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (viewModel.isStoreDefault) ...[
                    SizedBox(width: 4.w),
                    GestureDetector(
                      onTap: viewModel.openShopProfile,
                      child:
                          Icon(Icons.edit, size: 12.r, color: kcPrimaryColor),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
        if (!viewModel.isStoreDefault)
          GestureDetector(
            onTap: viewModel.openShopProfile,
            child: Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: kcLightSurfaceVariant,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(Icons.edit_outlined,
                  size: 18.r, color: kcLightSecondaryText),
            ),
          ),
      ],
    );
  }

  Widget _buildDateRow(HomeViewModel viewModel) {
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

class _HomeStatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final double change;
  final bool isMonetary;

  const _HomeStatCard({
    required this.icon,
    required this.label,
    required this.value,
    this.change = 0,
    this.isMonetary = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12.w, 10.h, 12.w, 10.h),
      decoration: BoxDecoration(
        color: kcPrimaryContainer,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(icon, color: kcPrimaryColor, size: 16.r),
              SizedBox(width: 4.w),
              BodyTextWidget(
                text: label,
                textType: TextType.xxsmall,
                color: kcLightSecondaryText,
              ),
            ],
          ),
          UIHelper.verticalSpace(4.h),
          TitleTextWidget(
            text: value,
            textType: TextType.small,
            fontWeight: FontWeight.w700,
            color: kcLightPrimaryText,
          ),
          if (change != 0) ...[
            UIHelper.verticalSpaceXXSmall,
            Row(
              children: [
                Icon(
                  change > 0 ? Icons.trending_up : Icons.trending_down,
                  size: 14.r,
                  color: change > 0 ? kcSuccessColor : kcErrorColor,
                ),
                SizedBox(width: 4.w),
                BodyTextWidget(
                  text: isMonetary
                      ? '₹${change.abs().toStringAsFixed(2)} vs yesterday'
                      : '${change.abs().toInt()} vs yesterday',
                  textType: TextType.xxsmall,
                  color: change > 0 ? kcSuccessColor : kcErrorColor,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
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
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: kcLightBorder)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor, size: 32.r),
            UIHelper.verticalSpaceXSmall,
            BodyTextWidget(
              text: title,
              color: titleColor,
              textType: TextType.xsmall,
              fontWeight: FontWeight.w600,
            ),
            if (subtitle != null)
              Padding(
                padding: EdgeInsets.only(top: 2.h),
                child: BodyTextWidget(
                  text: subtitle!,
                  color: titleColor.withValues(alpha: 0.7),
                  textType: TextType.xxsmall,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
