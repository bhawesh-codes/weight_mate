import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/base/widgets/scaffold/base_app_scaffold.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'home_viewmodel.dart';
import 'widgets/date_row.dart';
import 'widgets/header.dart';
import 'widgets/home_card_grid.dart';
import 'widgets/stats_row.dart';

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
                    const Header(),
                    UIHelper.verticalSpace(4.h),
                    const DateRow(),
                    UIHelper.verticalSpace(28.h),
                    HomeCardGrid(
                      onQuickCalculator: viewModel.openQuickCalculator,
                      onCreateBills: viewModel.openCreateBills,
                      onProducts: viewModel.openProducts,
                      onBillHistory: viewModel.openBillHistory,
                      onUploadQr: viewModel.openUploadQr,
                      onSettings: viewModel.openSettings,
                    ),
                  ],
                ),
              ),
            ),
            const StatsRow(),
          ],
        ),
      ),
    );
  }
}
