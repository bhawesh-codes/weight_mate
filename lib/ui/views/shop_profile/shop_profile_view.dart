import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/widgets/scaffold/base_app_scaffold.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'shop_profile_viewmodel.dart';
import 'widgets/profile_form_field.dart';
import 'widgets/section_label.dart';
import 'widgets/top_bar.dart';

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
            TopBar(onBack: viewModel.onBack),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UIHelper.verticalSpaceMedium,
                    const SectionLabel(text: 'Store Name'),
                    UIHelper.verticalSpace(8.h),
                    ProfileFormField(
                      controller: viewModel.nameController,
                      hintText: 'Enter store name',
                      prefixIcon: Icons.storefront_outlined,
                    ),
                    UIHelper.verticalSpace(24.h),
                    const SectionLabel(text: 'Store Address'),
                    UIHelper.verticalSpace(8.h),
                    ProfileFormField(
                      controller: viewModel.addressController,
                      hintText: 'Enter store address',
                      prefixIcon: Icons.location_on_outlined,
                    ),
                    UIHelper.verticalSpace(24.h),
                    const SectionLabel(text: 'Phone Number'),
                    UIHelper.verticalSpace(8.h),
                    ProfileFormField(
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
