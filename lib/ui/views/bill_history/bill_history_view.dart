import 'package:flutter/material.dart' hide SearchBar;
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/base/widgets/text/title_text.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'bill_history_viewmodel.dart';
import 'widgets/search_bar.dart';
import 'widgets/filter_chips.dart';
import 'widgets/bill_list.dart';

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
                const SearchBar(),
                const FilterChips(),
                Expanded(
                  child: viewModel.filteredBills.isEmpty
                      ? _buildEmptyState()
                      : const BillList(),
                ),
              ],
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
          const BodyTextWidget(
            text: 'No bills found',
            textType: TextType.medium,
            color: kcLightSecondaryText,
          ),
          UIHelper.verticalSpace(4.h),
          const BodyTextWidget(
            text: 'Try a different filter or create a new bill',
            textType: TextType.small,
            color: kcLightHintText,
          ),
        ],
      ),
    );
  }

  @override
  BillHistoryViewModel viewModelBuilder(BuildContext context) =>
      BillHistoryViewModel();

  @override
  void onViewModelReady(BillHistoryViewModel viewModel) {
    viewModel.init();
  }
}
