import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/base/widgets/text/title_text.dart';
import 'package:weight_mate/models/calculator_row.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'quick_calculator_viewmodel.dart';

class QuickCalculatorView extends StackedView<QuickCalculatorViewModel> {
  const QuickCalculatorView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, QuickCalculatorViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        surfaceTintColor: Colors.white,
        titleSpacing: 0,
        title: Row(
          children: [
            UIHelper.horizontalSpaceMedium,
            Icon(Icons.calculate, color: kcPrimaryColor, size: 28.r),
            UIHelper.horizontalSpaceSmall,
            const TitleTextWidget(
              text: 'Quick Calculator',
              color: kcPrimaryColor,
              textType: TextType.medium,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () => _showClearConfirm(context, viewModel),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8.w),
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: kcLightSurfaceVariant,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.delete_sweep, size: 18.r, color: kcErrorColor),
                  SizedBox(width: 4.w),
                  const BodyTextWidget(
                    text: 'Clear All',
                    textType: TextType.small,
                    color: kcErrorColor,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
          ),
          UIHelper.horizontalSpaceSmall,
        ],
      ),
      body: _CalculatorItemList(viewModel: viewModel),
      bottomSheet: _BottomSheet(viewModel: viewModel),
    );
  }

  void _showClearConfirm(
      BuildContext context, QuickCalculatorViewModel viewModel) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        title: const BodyTextWidget(
          text: 'Clear all items?',
          textType: TextType.small,
          fontWeight: FontWeight.w600,
        ),
        content: const BodyTextWidget(
          text: 'This will remove all calculator rows.',
          textType: TextType.xsmall,
          color: kcLightSecondaryText,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const BodyTextWidget(
              text: 'Cancel',
              textType: TextType.small,
              color: kcLightSecondaryText,
            ),
          ),
          TextButton(
            onPressed: () {
              viewModel.clearAll();
              Navigator.pop(ctx);
            },
            child: const BodyTextWidget(
              text: 'Clear',
              textType: TextType.small,
              color: kcErrorColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  @override
  QuickCalculatorViewModel viewModelBuilder(BuildContext context) =>
      QuickCalculatorViewModel();
}

class _CalculatorItemList extends StatefulWidget {
  final QuickCalculatorViewModel viewModel;

  const _CalculatorItemList({required this.viewModel});

  @override
  State<_CalculatorItemList> createState() => _CalculatorItemListState();
}

class _CalculatorItemListState extends State<_CalculatorItemList> {
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
          return _CalculatorRowWidget(
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

class _BottomSheet extends StatelessWidget {
  final QuickCalculatorViewModel viewModel;

  const _BottomSheet({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.r),
          topRight: Radius.circular(32.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 24,
            offset: const Offset(0, -8),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 8.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const BodyTextWidget(
                    text: 'Grand Total',
                    textType: TextType.medium,
                    color: kcLightSecondaryText,
                    fontWeight: FontWeight.w500,
                  ),
                  const Spacer(),
                  Text(
                    '₹ ${viewModel.grandTotal.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 38.sp,
                      fontWeight: FontWeight.w700,
                      color: kcPrimaryColor,
                      letterSpacing: -0.02,
                    ),
                  ),
                ],
              ),
              UIHelper.verticalSpace(12.h),
              SizedBox(
                width: double.infinity,
                height: 48.h,
                child: OutlinedButton.icon(
                  onPressed: viewModel.addRow,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: kcPrimaryColor,
                    side: BorderSide(
                        color: kcPrimaryColor.withValues(alpha: 0.3)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  icon: const Icon(Icons.add, size: 18),
                  label: const BodyTextWidget(
                    text: 'Add Item',
                    textType: TextType.small,
                    color: kcPrimaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              UIHelper.verticalSpace(12.h),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 52.h,
                      child: OutlinedButton.icon(
                        onPressed: () async {
                          await viewModel.saveToHistory();
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text('Saved to history'),
                                backgroundColor: kcSuccessColor,
                                behavior: SnackBarBehavior.floating,
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          }
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: kcPrimaryColor,
                          side:
                              const BorderSide(color: kcPrimaryColor, width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        icon: const Icon(Icons.history, size: 18),
                        label: const BodyTextWidget(
                          text: 'Save',
                          textType: TextType.small,
                          color: kcPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: SizedBox(
                      height: 52.h,
                      child: ElevatedButton.icon(
                        onPressed: viewModel.showQr,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kcPrimaryColor,
                          foregroundColor: Colors.white,
                          elevation: 4,
                          shadowColor: kcPrimaryColor.withValues(alpha: 0.2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        icon: const Icon(Icons.qr_code_2, size: 18),
                        label: const BodyTextWidget(
                          text: 'QR',
                          textType: TextType.small,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CalculatorRowWidget extends StatelessWidget {
  final int index;
  final CalculatorRow row;
  final ValueChanged<String> onPriceChanged;
  final ValueChanged<String> onWeightChanged;
  final ValueChanged<UnitType> onUnitChanged;

  const _CalculatorRowWidget({
    required this.index,
    required this.row,
    required this.onPriceChanged,
    required this.onWeightChanged,
    required this.onUnitChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: kcLightBorder),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 27.h,
            child: SegmentedButton<UnitType>(
              segments: UnitType.values.map((unit) {
                String label;
                switch (unit) {
                  case UnitType.kg:
                    label = 'kg';
                  case UnitType.gm:
                    label = 'g';
                  case UnitType.piece:
                    label = 'pc';
                  case UnitType.dozen:
                    label = 'doz';
                }
                return ButtonSegment(
                  value: unit,
                  label: Text(label, style: TextStyle(fontSize: 12.sp)),
                );
              }).toList(),
              selected: {row.unit},
              onSelectionChanged: (selected) => onUnitChanged(selected.first),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.selected)) {
                    return kcPrimaryColor;
                  }
                  return kcLightSurfaceVariant;
                }),
                foregroundColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.selected)) {
                    return Colors.white;
                  }
                  return kcLightSecondaryText;
                }),
                visualDensity: VisualDensity.compact,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              ),
            ),
          ),
          UIHelper.verticalSpace(12.h),
          Row(
            children: [
              Expanded(
                child: _InputField(
                  label: 'Price',
                  hint: 'e.g. 120',
                  prefix: '₹',
                  value: row.priceText,
                  onChanged: onPriceChanged,
                ),
              ),
              UIHelper.horizontalSpaceSmall,
              Expanded(
                child: _InputField(
                  label: 'Weight',
                  hint: 'e.g. 2.5',
                  value: row.weightText,
                  onChanged: onWeightChanged,
                ),
              ),
              UIHelper.horizontalSpaceSmall,
              Container(
                width: 90.w,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: kcPrimaryContainer,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const BodyTextWidget(
                      text: 'Total',
                      textType: TextType.xxsmall,
                      color: kcLightSecondaryText,
                    ),
                    UIHelper.verticalSpaceXXSmall,
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '₹${row.subtotal.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          color: kcPrimaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  final String label;
  final String? hint;
  final String? prefix;
  final Widget? suffix;
  final String value;
  final ValueChanged<String> onChanged;

  const _InputField({
    required this.label,
    this.hint,
    this.prefix,
    this.suffix,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BodyTextWidget(
          text: label,
          textType: TextType.xxsmall,
          color: kcLightSecondaryText,
        ),
        UIHelper.verticalSpace(4.h),
        Container(
          decoration: BoxDecoration(
            color: kcLightSurfaceVariant,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            children: [
              if (prefix != null)
                Padding(
                  padding: EdgeInsets.only(left: 12.w),
                  child: BodyTextWidget(
                    text: prefix!,
                    textType: TextType.xsmall,
                    color: kcLightSecondaryText,
                  ),
                ),
              Expanded(
                child: TextField(
                  controller: TextEditingController.fromValue(
                    TextEditingValue(
                      text: value,
                      selection: TextSelection.collapsed(offset: value.length),
                    ),
                  ),
                  onChanged: onChanged,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12.sp,
                      color: kcLightHintText,
                    ),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: prefix != null ? 4.w : 12.w,
                      vertical: 10,
                    ),
                  ),
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: kcLightPrimaryText,
                  ),
                ),
              ),
              if (suffix != null) suffix!,
            ],
          ),
        ),
      ],
    );
  }
}
