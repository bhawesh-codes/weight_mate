import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/base/widgets/text/title_text.dart';
import 'package:weight_mate/models/saved_product.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'add_product_viewmodel.dart';
import 'widgets/bottom_actions.dart';
import 'widgets/field_widget.dart';
import 'widgets/price_field.dart';

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
            FieldWidget(
              label: 'Product Name',
              hint: 'e.g. Fresh Tomatoes',
              icon: Icons.inventory_2,
              controller: viewModel.nameController,
              error: viewModel.nameError,
            ),
            UIHelper.verticalSpace(24.h),
            const PriceField(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomActions(),
    );
  }

  @override
  AddProductViewModel viewModelBuilder(BuildContext context) =>
      AddProductViewModel(product: product);
}
