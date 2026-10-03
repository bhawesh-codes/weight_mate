import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/models/saved_product.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'package:weight_mate/ui/views/add_product/add_product_viewmodel.dart';

class UnitSelector extends ViewModelWidget<AddProductViewModel> {
  const UnitSelector();

  @override
  Widget build(BuildContext context, AddProductViewModel viewModel) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: kcPrimaryContainer.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<PriceType>(
          value: viewModel.selectedPriceType,
          isDense: true,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
            color: kcPrimaryColor,
          ),
          items: PriceType.values.map((type) {
            String label;
            switch (type) {
              case PriceType.kg:
                label = '/ kg';
              case PriceType.gm:
                label = '/ gm';
              case PriceType.piece:
                label = '/ piece';
              case PriceType.dozen:
                label = '/ dozen';
            }
            return DropdownMenuItem(
              value: type,
              child: Text(label),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) viewModel.setPriceType(value);
          },
        ),
      ),
    );
  }
}
