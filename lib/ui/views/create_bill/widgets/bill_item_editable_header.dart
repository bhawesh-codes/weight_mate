import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/models/bill_item.dart';
import 'package:weight_mate/models/calculator_row.dart';
import 'package:weight_mate/ui/common/app_colors.dart';

class BillItemEditableHeader extends StatelessWidget {
  final BillItem item;
  final ValueChanged<String> onNameChanged;
  final ValueChanged<String> onPriceChanged;
  final ValueChanged<UnitType> onUnitChanged;

  const BillItemEditableHeader({
    required this.item,
    required this.onNameChanged,
    required this.onPriceChanged,
    required this.onUnitChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 44.h,
          child: TextField(
            controller: TextEditingController.fromValue(
              TextEditingValue(
                text: item.name,
                selection: TextSelection.collapsed(offset: item.name.length),
              ),
            ),
            onChanged: onNameChanged,
            decoration: InputDecoration(
              hintText: 'Item name',
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
              hintStyle: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16.sp,
                color: kcLightSecondaryText,
              ),
            ),
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: kcLightPrimaryText,
            ),
          ),
        ),
        UIHelper.verticalSpace(8.h),
        Row(
          children: [
            SizedBox(
              width: 120.w,
              child: SizedBox(
                height: 44.h,
                child: TextField(
                  controller: TextEditingController.fromValue(
                    TextEditingValue(
                      text: item.priceText,
                      selection: TextSelection.collapsed(
                          offset: item.priceText.length),
                    ),
                  ),
                  onChanged: onPriceChanged,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    hintText: 'Price',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 12.w, vertical: 10.h),
                    hintStyle: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14.sp,
                      color: kcLightSecondaryText,
                    ),
                  ),
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: kcLightPrimaryText,
                  ),
                ),
              ),
            ),
            UIHelper.horizontalSpaceSmall,
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: UnitType.values.map((unit) {
                    final isSelected = item.unit == unit;
                    return GestureDetector(
                      onTap: () => onUnitChanged(unit),
                      child: Container(
                        margin: EdgeInsets.only(right: 4.w),
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 6.h),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? kcPrimaryContainer
                              : Colors.transparent,
                          border: Border.all(color: kcLightBorder),
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: BodyTextWidget(
                          text: unit.name,
                          textType: TextType.xxsmall,
                          color: isSelected
                              ? kcPrimaryColor
                              : kcLightSecondaryText,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
