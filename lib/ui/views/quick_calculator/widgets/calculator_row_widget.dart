import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/models/calculator_row.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'package:weight_mate/ui/common/currency_helper.dart';
import 'input_field.dart';
import 'unit_segment_buttons.dart';
import 'subtotal_display.dart';

class CalculatorRowWidget extends StatelessWidget {
  final int index;
  final CalculatorRow row;
  final ValueChanged<String> onPriceChanged;
  final ValueChanged<String> onWeightChanged;
  final ValueChanged<UnitType> onUnitChanged;

  const CalculatorRowWidget({
    super.key,
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
          UnitSegmentButtons(
            selected: row.unit,
            onChanged: onUnitChanged,
          ),
          UIHelper.verticalSpace(12.h),
          Row(
            children: [
              Expanded(
                child: InputField(
                  label: 'Price',
                  hint: 'e.g. 120',
                  prefix: currencySymbol,
                  value: row.priceText,
                  onChanged: onPriceChanged,
                ),
              ),
              UIHelper.horizontalSpaceSmall,
              Expanded(
                child: InputField(
                  label: 'Weight',
                  hint: 'e.g. 2.5',
                  value: row.weightText,
                  onChanged: onWeightChanged,
                ),
              ),
              UIHelper.horizontalSpaceSmall,
              SubtotalDisplay(subtotal: row.subtotal),
            ],
          ),
        ],
      ),
    );
  }
}
