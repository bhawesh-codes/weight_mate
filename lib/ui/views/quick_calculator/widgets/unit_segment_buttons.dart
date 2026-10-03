import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:weight_mate/models/calculator_row.dart';
import 'package:weight_mate/ui/common/app_colors.dart';

class UnitSegmentButtons extends StatelessWidget {
  final UnitType selected;
  final ValueChanged<UnitType> onChanged;

  const UnitSegmentButtons({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
        selected: {selected},
        onSelectionChanged: (selected) => onChanged(selected.first),
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
    );
  }
}
