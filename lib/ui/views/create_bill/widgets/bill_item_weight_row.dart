import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/models/bill_item.dart';
import 'package:weight_mate/models/calculator_row.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'package:weight_mate/ui/common/currency_helper.dart';

class BillItemWeightRow extends StatelessWidget {
  final BillItem item;
  final String unitLabel;
  final ValueChanged<String> onWeightChanged;
  final ValueChanged<UnitType>? onWeightUnitChanged;

  const BillItemWeightRow({
    required this.item,
    required this.unitLabel,
    required this.onWeightChanged,
    this.onWeightUnitChanged,
  });

  @override
  Widget build(BuildContext context) {
    final showUnitToggle = onWeightUnitChanged != null;

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BodyTextWidget(
                text: 'Weight',
                textType: TextType.xsmall,
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
                    Expanded(
                      child: TextField(
                        controller: TextEditingController.fromValue(
                          TextEditingValue(
                            text: item.weightText,
                            selection: TextSelection.collapsed(
                              offset: item.weightText.length,
                            ),
                          ),
                        ),
                        onChanged: onWeightChanged,
                        keyboardType:
                            const TextInputType.numberWithOptions(decimal: true),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 10),
                        ),
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: kcLightPrimaryText,
                        ),
                      ),
                    ),
                    if (showUnitToggle)
                      _buildUnitToggle()
                    else
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        height: 40.h,
                        alignment: Alignment.center,
                        child: BodyTextWidget(
                          text: unitLabel,
                          textType: TextType.xsmall,
                          color: kcPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 12.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const BodyTextWidget(
              text: 'Subtotal',
              textType: TextType.xsmall,
              color: kcLightSecondaryText,
            ),
            UIHelper.verticalSpace(4.h),
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerRight,
              child: Text(
                formatPrice(item.subtotal),
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  color: kcPrimaryColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildUnitToggle() {
    final isWeight = item.unit == UnitType.kg || item.unit == UnitType.gm;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isWeight) ...[
          _unitChip(UnitType.kg, 'kg'),
          _unitChip(UnitType.gm, 'gm'),
        ] else ...[
          _unitChip(UnitType.piece, 'pcs'),
          _unitChip(UnitType.dozen, 'doz'),
        ],
        SizedBox(width: 4.w),
      ],
    );
  }

  Widget _unitChip(UnitType unit, String label) {
    final isSelected = item.weightUnit == unit;
    return GestureDetector(
      onTap: () => onWeightUnitChanged!(unit),
      child: Container(
        margin: EdgeInsets.only(right: 4.w),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: isSelected ? kcPrimaryContainer : Colors.transparent,
          border: Border.all(
            color: isSelected ? kcPrimaryColor : kcLightBorder,
          ),
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: BodyTextWidget(
          text: label,
          textType: TextType.xxsmall,
          color: isSelected ? kcPrimaryColor : kcLightSecondaryText,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
