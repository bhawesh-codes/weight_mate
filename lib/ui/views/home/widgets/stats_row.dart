import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:stacked/stacked.dart';

import 'package:weight_mate/ui/common/app_colors.dart';
import 'package:weight_mate/ui/common/currency_helper.dart';

import '../home_viewmodel.dart';
import 'home_stat_card.dart';

class StatsRow extends ViewModelWidget<HomeViewModel> {
  const StatsRow();

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: kcLightBorder)),
      ),
      child: Row(
        children: [
          Expanded(
            child: HomeStatCard(
              icon: Icons.currency_rupee,
              label: "Today's Revenue",
              value: formatPrice(viewModel.todayRevenue),
              change: viewModel.revenueChange,
              isMonetary: true,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: HomeStatCard(
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
}
