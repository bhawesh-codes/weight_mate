import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/models/bill_record.dart';
import '../bill_history_viewmodel.dart';
import 'shared.dart';
import 'date_header.dart';
import 'bill_card.dart';

class DateSection extends ViewModelWidget<BillHistoryViewModel> {
  final DateGroupKey dateKey;
  final List<BillRecord> bills;

  const DateSection({super.key, required this.dateKey, required this.bills});

  @override
  Widget build(BuildContext context, BillHistoryViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DateHeader(dateKey: dateKey),
        UIHelper.verticalSpace(8.h),
        ...bills.map((bill) => BillCard(bill: bill)),
        UIHelper.verticalSpaceMedium,
      ],
    );
  }
}
