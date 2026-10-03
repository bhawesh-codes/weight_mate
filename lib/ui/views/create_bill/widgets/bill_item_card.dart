import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/models/bill_item.dart';
import 'package:weight_mate/models/calculator_row.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'bill_item_header.dart';
import 'bill_item_weight_row.dart';

class BillItemCard extends StatelessWidget {
  final BillItem item;
  final ValueChanged<String> onNameChanged;
  final ValueChanged<String> onPriceChanged;
  final ValueChanged<UnitType> onUnitChanged;
  final ValueChanged<String> onWeightChanged;
  final ValueChanged<UnitType> onWeightUnitChanged;
  final VoidCallback onRemove;

  const BillItemCard({
    required this.item,
    required this.onNameChanged,
    required this.onPriceChanged,
    required this.onUnitChanged,
    required this.onWeightChanged,
    required this.onWeightUnitChanged,
    required this.onRemove,
  });

  String _unitLabel(UnitType unit) {
    switch (unit) {
      case UnitType.kg:
        return 'kg';
      case UnitType.gm:
        return 'gm';
      case UnitType.piece:
        return 'pcs';
      case UnitType.dozen:
        return 'doz';
    }
  }

  @override
  Widget build(BuildContext context) {
    final unitLabel = _unitLabel(item.unit);

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: kcLightBorder),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [
          BillItemHeader(
            item: item,
            unitLabel: unitLabel,
            onNameChanged: onNameChanged,
            onPriceChanged: onPriceChanged,
            onUnitChanged: onUnitChanged,
            onRemove: onRemove,
          ),
          UIHelper.verticalSpace(12.h),
          BillItemWeightRow(
            item: item,
            unitLabel: unitLabel,
            onWeightChanged: onWeightChanged,
            onWeightUnitChanged: onWeightUnitChanged,
          ),
        ],
      ),
    );
  }
}
