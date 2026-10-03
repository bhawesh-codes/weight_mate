import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'package:weight_mate/ui/views/saved_products/saved_products_viewmodel.dart';

class SearchBar extends ViewModelWidget<SavedProductsViewModel> {
  const SearchBar();

  @override
  Widget build(BuildContext context, SavedProductsViewModel viewModel) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 12.h),
      child: Container(
        height: 56.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: kcLightSurfaceVariant,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            Icon(Icons.search, color: kcLightSecondaryText, size: 20.r),
            SizedBox(width: 12.w),
            Expanded(
              child: TextField(
                controller: viewModel.searchController,
                onChanged: viewModel.onSearch,
                decoration: InputDecoration(
                  hintText: 'Search saved products...',
                  hintStyle: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14.sp,
                    color: kcLightHintText,
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14.sp,
                  color: kcLightPrimaryText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
