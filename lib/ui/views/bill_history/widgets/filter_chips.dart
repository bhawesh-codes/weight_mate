import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import '../bill_history_viewmodel.dart';

class FilterChips extends ViewModelWidget<BillHistoryViewModel> {
  const FilterChips({super.key});

  @override
  Widget build(BuildContext context, BillHistoryViewModel viewModel) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 8.h),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: BillHistoryFilter.values.map((filter) {
            final isSelected = viewModel.selectedFilter == filter;
            String label;
            switch (filter) {
              case BillHistoryFilter.all:
                label = 'All';
              case BillHistoryFilter.today:
                label = 'Today';
              case BillHistoryFilter.week:
                label = 'Week';
              case BillHistoryFilter.month:
                label = 'Month';
              case BillHistoryFilter.threeMonths:
                label = '3 Months';
            }
            return Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: GestureDetector(
                onTap: () => viewModel.setFilter(filter),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: isSelected ? kcPrimaryColor : kcLightSurfaceVariant,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: BodyTextWidget(
                    text: label,
                    textType: TextType.xsmall,
                    color: isSelected ? Colors.white : kcLightSecondaryText,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
