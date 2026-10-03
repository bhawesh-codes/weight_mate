import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/base/widgets/text/title_text.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import '../settings_viewmodel.dart';

class TopBar extends ViewModelWidget<SettingsViewModel> {
  const TopBar();

  @override
  Widget build(BuildContext context, SettingsViewModel viewModel) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: viewModel.onBack,
            child: Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: kcPrimaryContainer,
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Icon(Icons.arrow_back, color: kcPrimaryColor, size: 24.r),
            ),
          ),
          SizedBox(width: 12.w),
          const TitleTextWidget(
            text: 'Settings',
            color: kcPrimaryColor,
            textType: TextType.medium,
            fontWeight: FontWeight.bold,
          ),
          const Spacer(),
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: kcLightSurfaceVariant,
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: kcLightBorder),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Image.network(
                'https://lh3.googleusercontent.com/aida-public/AB6AXuD2U_dyh2QgqGYjuGWCpqVPVP0G1dmBAt0D0df0DKznEV3vD-5mJ-PcN1mdGQHZB_ayjlLZlwwO1iITkklTdlH9jmCAU74XzDaan3DKneIRMZwWs5JdTTFZxRkjk2ycCY9OuXnnW45CKmjwDIGvSBy6Ns2ENtFRqMV4aXY6E7Qwi4ldLf6sATQk4WnIYshSqyijDGGEi5OpjehonYG3hrDq6q0QThgqtWl-6smtDuIBp-1lmImQTP9f',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Icon(Icons.person, color: kcPrimaryColor, size: 20.r),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
