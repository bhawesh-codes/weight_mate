import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/ui/views/quick_calculator/quick_calculator_viewmodel.dart';
import 'calculator_row_widget.dart';

class CalculatorItemList extends StatefulWidget {
  final QuickCalculatorViewModel viewModel;

  const CalculatorItemList({super.key, required this.viewModel});

  @override
  State<CalculatorItemList> createState() => _CalculatorItemListState();
}

class _CalculatorItemListState extends State<CalculatorItemList> {
  final _scrollController = ScrollController();
  int _prevRowCount = 1;

  @override
  void initState() {
    super.initState();
    widget.viewModel.addListener(_onRowsChanged);
  }

  @override
  void dispose() {
    widget.viewModel.removeListener(_onRowsChanged);
    _scrollController.dispose();
    super.dispose();
  }

  void _onRowsChanged() {
    final currentCount = widget.viewModel.rows.length;
    if (currentCount > _prevRowCount && currentCount > 1) {
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
    _prevRowCount = currentCount;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 220.h),
      itemCount: widget.viewModel.rows.length + 1,
      itemBuilder: (context, index) {
        if (index < widget.viewModel.rows.length) {
          return CalculatorRowWidget(
            index: index,
            row: widget.viewModel.rows[index],
            onPriceChanged: (v) => widget.viewModel.updatePrice(index, v),
            onWeightChanged: (v) => widget.viewModel.updateWeight(index, v),
            onUnitChanged: (v) => widget.viewModel.updateUnit(index, v),
          );
        }
        return UIHelper.verticalSpace(24.h);
      },
    );
  }
}
