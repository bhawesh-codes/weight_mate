import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/base/widgets/text/title_text.dart';
import 'package:weight_mate/models/saved_product.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'add_product_viewmodel.dart';

class AddProductView extends StackedView<AddProductViewModel> {
  final SavedProduct? product;
  const AddProductView({Key? key, this.product}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, AddProductViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        surfaceTintColor: Colors.white,
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: viewModel.cancel,
        ),
        title: TitleTextWidget(
          text: viewModel.isEditing ? 'Edit Product' : 'Add Product',
          textType: TextType.medium,
          fontWeight: FontWeight.w700,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: CircleAvatar(
              radius: 16.r,
              backgroundColor: kcPrimaryContainer,
              child: Icon(Icons.person, size: 18.r, color: kcPrimaryColor),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 120.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildField(
              label: 'Product Name',
              hint: 'e.g. Fresh Tomatoes',
              icon: Icons.inventory_2,
              controller: viewModel.nameController,
              error: viewModel.nameError,
            ),
            UIHelper.verticalSpace(24.h),
            _buildPriceField(viewModel),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomActions(viewModel),
    );
  }

  Widget _buildField({
    required String label,
    required String hint,
    required IconData icon,
    required TextEditingController controller,
    String? error,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleTextWidget(
          text: label,
          textType: TextType.small,
          fontWeight: FontWeight.w600,
        ),
        UIHelper.verticalSpace(8.h),
        Container(
          height: 64.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: error != null ? kcErrorColor : kcLightBorder,
            ),
          ),
          child: Row(
            children: [
              UIHelper.horizontalSpaceMedium,
              Icon(icon, color: kcLightSecondaryText, size: 20.r),
              SizedBox(width: 12.w),
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14.sp,
                      color: kcLightHintText,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                  ),
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16.sp,
                    color: kcLightPrimaryText,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (error != null)
          Padding(
            padding: EdgeInsets.only(top: 4.h, left: 4.w),
            child: BodyTextWidget(
              text: error,
              textType: TextType.xsmall,
              color: kcErrorColor,
            ),
          ),
      ],
    );
  }

  Widget _buildPriceField(AddProductViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleTextWidget(
          text: 'Price',
          textType: TextType.small,
          fontWeight: FontWeight.w600,
        ),
        UIHelper.verticalSpace(8.h),
        Container(
          height: 64.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: viewModel.priceError != null ? kcErrorColor : kcLightBorder,
            ),
          ),
          child: Row(
            children: [
              UIHelper.horizontalSpaceMedium,
              TitleTextWidget(
                text: '₹',
                textType: TextType.medium,
                fontWeight: FontWeight.w600,
                color: kcLightSecondaryText,
              ),
              UIHelper.horizontalSpaceSmall,
              Expanded(
                child: TextField(
                  controller: viewModel.priceController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    hintText: '0.00',
                    hintStyle: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14.sp,
                      color: kcLightHintText,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                  ),
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: kcLightPrimaryText,
                  ),
                ),
              ),
              UIHelper.horizontalSpaceSmall,
              _buildUnitSelector(viewModel),
              UIHelper.horizontalSpaceSmall,
            ],
          ),
        ),
        if (viewModel.priceError != null)
          Padding(
            padding: EdgeInsets.only(top: 4.h, left: 4.w),
            child: BodyTextWidget(
              text: viewModel.priceError!,
              textType: TextType.xsmall,
              color: kcErrorColor,
            ),
          ),
      ],
    );
  }

  Widget _buildUnitSelector(AddProductViewModel viewModel) {
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

  Widget _buildBottomActions(AddProductViewModel viewModel) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 24.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: kcLightBorder)),
      ),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 56.h,
              child: OutlinedButton(
                onPressed: viewModel.cancel,
                style: OutlinedButton.styleFrom(
                  foregroundColor: kcLightSecondaryText,
                  side: BorderSide(color: kcLightBorder),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: const BodyTextWidget(
                  text: 'Cancel',
                  textType: TextType.small,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          UIHelper.horizontalSpaceMedium,
          Expanded(
            child: SizedBox(
              height: 56.h,
              child: ElevatedButton(
                onPressed: viewModel.isBusy ? null : viewModel.validateAndSave,
                style: ElevatedButton.styleFrom(
                  backgroundColor: kcPrimaryColor,
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: kcLightBorder,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: viewModel.isBusy
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : BodyTextWidget(
                        text: viewModel.isEditing ? 'Update Product' : 'Save Product',
                        textType: TextType.small,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  AddProductViewModel viewModelBuilder(BuildContext context) =>
      AddProductViewModel(product: product);
}
