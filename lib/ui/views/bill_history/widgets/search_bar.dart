import 'package:flutter/material.dart' hide SearchBar;
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import '../bill_history_viewmodel.dart';

class SearchBar extends ViewModelWidget<BillHistoryViewModel> {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context, BillHistoryViewModel viewModel) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 0),
      child: TextField(
        controller: viewModel.searchController,
        onChanged: viewModel.onSearch,
        onTapOutside: (_) => FocusScope.of(context).unfocus(),
        decoration: InputDecoration(
          hintText: 'Search by bill number...',
          hintStyle: TextStyle(
            fontFamily: 'Inter',
            fontSize: 13.sp,
            color: kcLightHintText,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 14.w),
            child: Icon(Icons.search, color: kcLightSecondaryText, size: 18.r),
          ),
          prefixIconConstraints: BoxConstraints(minWidth: 14.w, minHeight: 0),
          filled: true,
          fillColor: kcLightSurfaceVariant,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide.none,
          ),
          isDense: true,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
        ),
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 13.sp,
          color: kcLightPrimaryText,
        ),
      ),
    );
  }
}
