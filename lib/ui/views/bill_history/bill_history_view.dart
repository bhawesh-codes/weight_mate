import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/base/widgets/text/title_text.dart';
import 'package:weight_mate/models/bill_record.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'bill_history_viewmodel.dart';

class BillHistoryView extends StackedView<BillHistoryViewModel> {
  const BillHistoryView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, BillHistoryViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        surfaceTintColor: Colors.white,
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: viewModel.goBack,
        ),
        title: const TitleTextWidget(
          text: 'Bill History',
          textType: TextType.medium,
          fontWeight: FontWeight.w700,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: CircleAvatar(
              radius: 16.r,
              backgroundColor: kcPrimaryContainer,
              child: Icon(Icons.person, size: 18.r, color: kcPrimaryColor),
            ),
          ),
        ],
      ),
      body: viewModel.isBusy
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                _buildSearchBar(context, viewModel),
                _buildFilterChips(viewModel),
                Expanded(
                  child: viewModel.filteredBills.isEmpty
                      ? _buildEmptyState()
                      : _buildBillList(viewModel),
                ),
              ],
            ),
    );
  }

  Widget _buildSearchBar(BuildContext context, BillHistoryViewModel viewModel) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 0),
      child: TextField(
        controller: viewModel.searchController,
        onChanged: viewModel.onSearch,
        onTapOutside: (_) => FocusScope.of(context).unfocus(),
        decoration: InputDecoration(
          hintText: 'Search by bill number...',
          hintStyle: TextStyle(
            fontFamily: 'Inter',
            fontSize: 13.sp,
            color: kcLightHintText,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 14.w),
            child: Icon(Icons.search, color: kcLightSecondaryText, size: 18.r),
          ),
          prefixIconConstraints: BoxConstraints(minWidth: 14.w, minHeight: 0),
          filled: true,
          fillColor: kcLightSurfaceVariant,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide.none,
          ),
          isDense: true,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
        ),
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 13.sp,
          color: kcLightPrimaryText,
        ),
      ),
    );
  }

  Widget _buildFilterChips(BillHistoryViewModel viewModel) {
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

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.receipt_long_outlined,
              size: 64.r, color: kcLightSecondaryText),
          UIHelper.verticalSpaceMedium,
          BodyTextWidget(
            text: 'No bills found',
            textType: TextType.medium,
            color: kcLightSecondaryText,
          ),
          UIHelper.verticalSpace(4.h),
          BodyTextWidget(
            text: 'Try a different filter or create a new bill',
            textType: TextType.small,
            color: kcLightHintText,
          ),
        ],
      ),
    );
  }

  Widget _buildBillList(BillHistoryViewModel viewModel) {
    final grouped = _groupBills(viewModel.filteredBills);
    return ListView(
      padding: EdgeInsets.fromLTRB(16.w, 4.h, 16.w, 24.h),
      children: grouped.entries
          .map(
            (entry) => _buildDateSection(entry.key, entry.value, viewModel),
          )
          .toList(),
    );
  }

  Widget _buildDateSection(
    _DateGroupKey key,
    List<BillRecord> bills,
    BillHistoryViewModel viewModel,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDateHeader(key),
        UIHelper.verticalSpace(8.h),
        ...bills.map((bill) => _buildBillCard(bill, viewModel)),
        UIHelper.verticalSpaceMedium,
      ],
    );
  }

  Widget _buildDateHeader(_DateGroupKey key) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        children: [
          TitleTextWidget(
            text: key.label,
            textType: TextType.xxsmall,
            fontWeight: FontWeight.w700,
            color: kcLightSecondaryText,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Container(height: 1, color: kcLightBorder),
          ),
        ],
      ),
    );
  }

  Widget _buildBillCard(BillRecord bill, BillHistoryViewModel viewModel) {
    final timeStr = _formatTime(bill.createdAt);
    return GestureDetector(
      onTap: () => viewModel.onBillTap(bill),
      child: Container(
        margin: EdgeInsets.only(bottom: 8.h),
        padding: EdgeInsets.all(14.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: kcLightBorder),
        ),
        child: Row(
          children: [
            Container(
              width: 44.w,
              height: 44.w,
              decoration: BoxDecoration(
                color: kcPrimaryContainer,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.receipt_long,
                color: kcPrimaryColor,
                size: 22.r,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleTextWidget(
                    text: '#${bill.billNumber}',
                    textType: TextType.small,
                    fontWeight: FontWeight.w700,
                  ),
                  UIHelper.verticalSpaceXXSmall,
                  BodyTextWidget(
                    text: '$timeStr • ${bill.itemCount} items',
                    textType: TextType.xsmall,
                    color: kcLightSecondaryText,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TitleTextWidget(
                  text: '₹${bill.grandTotal.toStringAsFixed(2)}',
                  textType: TextType.small,
                  fontWeight: FontWeight.w700,
                  color: kcPrimaryColor,
                ),
                SizedBox(width: 4.w),
                Icon(Icons.chevron_right, color: kcLightBorder, size: 18.r),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Map<_DateGroupKey, List<BillRecord>> _groupBills(List<BillRecord> bills) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));

    final groups = <_DateGroupKey, List<BillRecord>>{};
    for (final bill in bills) {
      final billDate = DateTime(
        bill.createdAt.year,
        bill.createdAt.month,
        bill.createdAt.day,
      );
      _DateGroupKey key;
      if (billDate == today) {
        key = _DateGroupKey(
          label: 'TODAY, ${_formatDate(bill.createdAt)}',
          date: billDate,
        );
      } else if (billDate == yesterday) {
        key = _DateGroupKey(
          label: 'YESTERDAY, ${_formatDate(bill.createdAt)}',
          date: billDate,
        );
      } else {
        key = _DateGroupKey(
          label: _formatHeaderDate(bill.createdAt),
          date: billDate,
        );
      }
      groups.putIfAbsent(key, () => []);
      groups[key]!.add(bill);
    }

    final sorted = groups.entries.toList()
      ..sort((a, b) => b.key.date.compareTo(a.key.date));
    return {for (final e in sorted) e.key: e.value};
  }

  String _formatTime(DateTime date) {
    final hour =
        date.hour > 12 ? date.hour - 12 : (date.hour == 0 ? 12 : date.hour);
    final amPm = date.hour >= 12 ? 'PM' : 'AM';
    return '${hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')} $amPm';
  }

  String _formatDate(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return '${months[date.month - 1]} ${date.day}';
  }

  String _formatHeaderDate(DateTime date) {
    const months = [
      'JAN',
      'FEB',
      'MAR',
      'APR',
      'MAY',
      'JUN',
      'JUL',
      'AUG',
      'SEP',
      'OCT',
      'NOV',
      'DEC'
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }

  @override
  BillHistoryViewModel viewModelBuilder(BuildContext context) =>
      BillHistoryViewModel();

  @override
  void onViewModelReady(BillHistoryViewModel viewModel) {
    viewModel.init();
  }
}

class _DateGroupKey {
  final String label;
  final DateTime date;

  _DateGroupKey({required this.label, required this.date});

  @override
  bool operator ==(Object other) =>
      other is _DateGroupKey && date == other.date;

  @override
  int get hashCode => date.hashCode;
}
