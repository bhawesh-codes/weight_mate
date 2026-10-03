import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/ui/views/create_bill/create_bill_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'quick_add_section.dart';
import 'bill_summary_section.dart';
import 'add_custom_item_button.dart';

class BillBody extends ViewModelWidget<CreateBillViewModel> {
  const BillBody();

  @override
  Widget build(BuildContext context, CreateBillViewModel viewModel) {
    return _BillBodyWithScroll(viewModel: viewModel);
  }
}

class _BillBodyWithScroll extends StatefulWidget {
  final CreateBillViewModel viewModel;

  const _BillBodyWithScroll({required this.viewModel});

  @override
  State<_BillBodyWithScroll> createState() => _BillBodyWithScrollState();
}

class _BillBodyWithScrollState extends State<_BillBodyWithScroll> {
  final _scrollController = ScrollController();
  int _prevItemCount = 0;

  @override
  void initState() {
    super.initState();
    widget.viewModel.addListener(_onItemsChanged);
    _prevItemCount = widget.viewModel.items.length;
  }

  @override
  void dispose() {
    widget.viewModel.removeListener(_onItemsChanged);
    _scrollController.dispose();
    super.dispose();
  }

  void _onItemsChanged() {
    final currentCount = widget.viewModel.items.length;
    if (currentCount > _prevItemCount && currentCount > 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    }
    _prevItemCount = currentCount;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: _scrollController,
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 160.h),
      children: [
        QuickAddSection(viewModel: widget.viewModel),
        UIHelper.verticalSpace(24.h),
        BillSummarySection(viewModel: widget.viewModel),
        UIHelper.verticalSpaceMedium,
        AddCustomItemButton(onTap: widget.viewModel.addCustomItemRow),
      ],
    );
  }
}
