import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:stacked/stacked.dart';
import '../bill_history_viewmodel.dart';
import 'shared.dart';
import 'date_section.dart';

class BillList extends ViewModelWidget<BillHistoryViewModel> {
  const BillList({super.key});

  @override
  Widget build(BuildContext context, BillHistoryViewModel viewModel) {
    final grouped = groupBills(viewModel.filteredBills);
    return ListView(
      padding: EdgeInsets.fromLTRB(16.w, 4.h, 16.w, 24.h),
      children: grouped.entries
          .map(
            (entry) => DateSection(dateKey: entry.key, bills: entry.value),
          )
          .toList(),
    );
  }
}
