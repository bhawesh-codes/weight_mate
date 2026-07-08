import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:stacked/stacked.dart';
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
            SizedBox(width: 16.w),
            Icon(Icons.storefront, color: kcPrimaryColor, size: 28.r),
            SizedBox(width: 8.w),
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
            onTap: viewModel.clearAll,
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
          SizedBox(width: 8.w),
        ],
      ),
      body: _CalculatorItemList(viewModel: viewModel),
      bottomSheet: _BottomSheet(viewModel: viewModel),
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
        return Padding(
          padding: EdgeInsets.only(top: 24.h),
          child: Center(
            child: GestureDetector(
              onTap: widget.viewModel.addRow,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
                decoration: BoxDecoration(
                  color: kcPrimaryContainer,
                  borderRadius: BorderRadius.circular(24.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add, color: kcPrimaryColor, size: 20.r),
                    SizedBox(width: 8.w),
                    const BodyTextWidget(
                      text: 'Add Item',
                      textType: TextType.medium,
                      color: kcPrimaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
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
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w700,
                      color: kcPrimaryColor,
                      letterSpacing: -0.02,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 56.h,
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: kcPrimaryColor,
                          side:
                              const BorderSide(color: kcPrimaryColor, width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        icon: const Icon(Icons.history, size: 20),
                        label: const BodyTextWidget(
                          text: 'Save to History',
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
                      height: 56.h,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kcPrimaryColor,
                          foregroundColor: Colors.white,
                          elevation: 4,
                          shadowColor: kcPrimaryColor.withValues(alpha: 0.2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        icon: const Icon(Icons.qr_code_2, size: 20),
                        label: const BodyTextWidget(
                          text: 'Show QR',
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

  String _priceLabel(UnitType unit) => switch (unit) {
        UnitType.kg || UnitType.gm => 'Price/kg',
        UnitType.piece => 'Price/piece',
        UnitType.dozen => 'Price/dozen',
      };

  String _weightLabel(UnitType unit) => switch (unit) {
        UnitType.kg => 'Weight',
        UnitType.gm => 'Weight (gm)',
        UnitType.piece => 'Pieces',
        UnitType.dozen => 'Dozen',
      };

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: kcLightBorder),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 7,
                child: _UnitChips(
                  selected: row.unit,
                  onChanged: onUnitChanged,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const BodyTextWidget(
                      text: 'Subtotal',
                      textType: TextType.xsmall,
                      color: kcLightSecondaryText,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '₹ ${row.subtotal.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: kcPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Expanded(
                child: _InputField(
                  label: _priceLabel(row.unit),
                  prefix: '₹',
                  value: row.priceText,
                  onChanged: onPriceChanged,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: _InputField(
                  label: _weightLabel(row.unit),
                  suffix: IconButton(
                    icon: Icon(Icons.close, size: 16.r, color: kcLightHintText),
                    onPressed: () => onWeightChanged(''),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  value: row.weightText,
                  onChanged: onWeightChanged,
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
  final String? prefix;
  final Widget? suffix;
  final String value;
  final ValueChanged<String> onChanged;

  const _InputField({
    required this.label,
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
          textType: TextType.xsmall,
          color: kcLightSecondaryText,
        ),
        SizedBox(height: 4.h),
        Container(
          decoration: BoxDecoration(
            color: kcLightSurfaceVariant,
            borderRadius: BorderRadius.circular(12.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Row(
            children: [
              if (prefix != null) ...[
                BodyTextWidget(
                  text: prefix!,
                  textType: TextType.small,
                  color: kcLightSecondaryText,
                ),
                SizedBox(width: 4.w),
              ],
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
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 12),
                  ),
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 18.sp,
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

class _UnitChips extends StatelessWidget {
  final UnitType selected;
  final ValueChanged<UnitType> onChanged;

  const _UnitChips({required this.selected, required this.onChanged});

  static const _units = [
    UnitType.kg,
    UnitType.gm,
    UnitType.piece,
    UnitType.dozen
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const BodyTextWidget(
          text: 'Unit',
          textType: TextType.xsmall,
          color: kcLightSecondaryText,
        ),
        SizedBox(height: 4.h),
        Container(
          decoration: BoxDecoration(
            color: kcLightSurfaceVariant,
            borderRadius: BorderRadius.circular(8.r),
          ),
          padding: EdgeInsets.all(4.r),
          child: Column(
            children: [
              Row(
                children: _units
                    .sublist(0, 2)
                    .map((unit) => _buildChip(unit))
                    .toList(),
              ),
              SizedBox(height: 4.h),
              Row(
                children: _units
                    .sublist(2, 4)
                    .map((unit) => _buildChip(unit))
                    .toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildChip(UnitType unit) {
    final isSelected = selected == unit;
    return Expanded(
      child: GestureDetector(
        onTap: () => onChanged(unit),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          decoration: BoxDecoration(
            color: isSelected ? kcPrimaryContainer : Colors.transparent,
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: Center(
            child: BodyTextWidget(
              text: unit.name,
              textType: TextType.xsmall,
              color: isSelected ? kcPrimaryColor : kcLightSecondaryText,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final Color activeColor;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    final color = isActive ? activeColor : kcLightSecondaryText;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: isActive ? kcPrimaryContainer : Colors.transparent,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 22.r, color: color),
                if (isActive) ...[
                  SizedBox(width: 4.w),
                  BodyTextWidget(
                    text: label,
                    textType: TextType.xsmall,
                    color: color,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ],
            ),
          ),
          if (!isActive)
            Padding(
              padding: EdgeInsets.only(top: 2.h),
              child: BodyTextWidget(
                text: label,
                textType: TextType.xxsmall,
                color: color,
              ),
            ),
        ],
      ),
    );
  }
}
