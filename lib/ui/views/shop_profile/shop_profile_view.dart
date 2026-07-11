import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/widgets/scaffold/base_app_scaffold.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/base/widgets/text/title_text.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'shop_profile_viewmodel.dart';

class ShopProfileView extends StackedView<ShopProfileViewModel> {
  const ShopProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, ShopProfileViewModel viewModel, Widget? child) {
    return BaseAppScaffold(
      statusBarColor: kcBackgroundColor,
      statusBarIconBrightness: Brightness.dark,
      body: SafeArea(
        child: Column(
          children: [
            _TopBar(onBack: viewModel.onBack),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UIHelper.verticalSpaceMedium,
                    const _SectionLabel(text: 'Store Name'),
                    UIHelper.verticalSpace(8.h),
                    _FormField(
                      controller: viewModel.nameController,
                      hintText: 'Enter store name',
                      prefixIcon: Icons.storefront_outlined,
                    ),
                    UIHelper.verticalSpace(24.h),
                    const _SectionLabel(text: 'Store Address'),
                    UIHelper.verticalSpace(8.h),
                    _FormField(
                      controller: viewModel.addressController,
                      hintText: 'Enter store address',
                      prefixIcon: Icons.location_on_outlined,
                    ),
                    UIHelper.verticalSpace(24.h),
                    const _SectionLabel(text: 'Phone Number'),
                    UIHelper.verticalSpace(8.h),
                    _FormField(
                      controller: viewModel.phoneController,
                      hintText: 'Enter phone number',
                      prefixIcon: Icons.phone_outlined,
                      keyboardType: TextInputType.phone,
                    ),
                    UIHelper.verticalSpace(40.h),
                    SizedBox(
                      width: double.infinity,
                      height: 56.h,
                      child: ElevatedButton(
                        onPressed: viewModel.save,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kcPrimaryColor,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                        child: const BodyTextWidget(
                          text: 'Save Changes',
                          textType: TextType.medium,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ShopProfileViewModel viewModelBuilder(BuildContext context) =>
      ShopProfileViewModel();
}

class _TopBar extends StatelessWidget {
  final VoidCallback onBack;
  const _TopBar({required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: onBack,
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
            text: 'Shop Profile',
            color: kcPrimaryColor,
            textType: TextType.medium,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    return BodyTextWidget(
      text: text,
      color: kcLightPrimaryText,
      textType: TextType.smedium,
      fontWeight: FontWeight.w600,
    );
  }
}

class _FormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData prefixIcon;
  final TextInputType? keyboardType;

  const _FormField({
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kcLightSurfaceVariant,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: kcLightBorder.withValues(alpha: 0.5)),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontFamily: 'Inter',
            fontSize: 16.sp,
            color: kcLightHintText,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: Icon(prefixIcon, color: kcPrimaryColor, size: 22.r),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        ),
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 16.sp,
          color: kcLightPrimaryText,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
