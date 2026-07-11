import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/base/widgets/text/title_text.dart';
import 'package:weight_mate/models/saved_product.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'saved_products_viewmodel.dart';

class SavedProductsView extends StackedView<SavedProductsViewModel> {
  const SavedProductsView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, SavedProductsViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        surfaceTintColor: Colors.white,
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: viewModel.goBack,
        ),
        title: const TitleTextWidget(
          text: 'Saved Products',
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
      body: viewModel.isBusy
          ? const Center(child: CircularProgressIndicator())
          : _buildBody(viewModel),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.openAddProduct,
        backgroundColor: kcPrimaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Icon(Icons.add, size: 28.r),
      ),
    );
  }

  Widget _buildBody(SavedProductsViewModel viewModel) {
    final products = viewModel.filteredProducts;
    return Column(
      children: [
        _buildSearchBar(viewModel),
        Expanded(
          child: products.isEmpty
              ? _buildEmptyState(viewModel)
              : _buildProductList(viewModel),
        ),
      ],
    );
  }

  Widget _buildSearchBar(SavedProductsViewModel viewModel) {
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

  Widget _buildEmptyState(SavedProductsViewModel viewModel) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.inventory_2_outlined,
                size: 80.r, color: kcLightSecondaryText),
            UIHelper.verticalSpaceMedium,
            TitleTextWidget(
              text: 'No products found',
              textType: TextType.medium,
              fontWeight: FontWeight.w600,
            ),
            UIHelper.verticalSpace(8.h),
            BodyTextWidget(
              text:
                  'Your product list is currently empty.\nStart adding items to speed up your billing process.',
              textType: TextType.small,
              color: kcLightSecondaryText,
              textAlign: TextAlign.center,
            ),
            UIHelper.verticalSpace(24.h),
            ElevatedButton(
              onPressed: viewModel.openAddProduct,
              style: ElevatedButton.styleFrom(
                backgroundColor: kcPrimaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28.r),
                ),
                padding:
                    EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.add, size: 20),
                  UIHelper.horizontalSpaceSmall,
                  BodyTextWidget(
                    text: 'Add Your First Product',
                    textType: TextType.small,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductList(SavedProductsViewModel viewModel) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      itemCount: viewModel.filteredProducts.length,
      itemBuilder: (context, index) {
        final product = viewModel.filteredProducts[index];
        return _buildProductCard(product, viewModel);
      },
    );
  }

  Widget _buildProductCard(
      SavedProduct product, SavedProductsViewModel viewModel) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: kcLightBorder),
      ),
      child: Row(
        children: [
          Container(
            width: 48.w,
            height: 48.w,
            decoration: BoxDecoration(
              color: kcPrimaryContainer.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(Icons.inventory_2, color: kcPrimaryColor, size: 24.r),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TitleTextWidget(
                  text: product.name,
                  textType: TextType.small,
                  fontWeight: FontWeight.w600,
                ),
                UIHelper.verticalSpaceXXSmall,
                BodyTextWidget(
                  text: '₹${product.price.toStringAsFixed(2)}${_priceTypeSuffix(product.priceType)}',
                  textType: TextType.xsmall,
                  color: kcLightSecondaryText,
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.edit_outlined,
                    size: 18.r, color: kcLightSecondaryText),
                onPressed: () => viewModel.editProduct(product),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              IconButton(
                icon: Icon(Icons.delete_outline,
                    size: 18.r, color: kcLightSecondaryText),
                onPressed: () => viewModel.deleteProduct(product.id),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _priceTypeSuffix(PriceType type) {
    switch (type) {
      case PriceType.kg:
        return ' / kg';
      case PriceType.gm:
        return ' / gm';
      case PriceType.piece:
        return ' / piece';
      case PriceType.dozen:
        return ' / dozen';
    }
  }

  @override
  SavedProductsViewModel viewModelBuilder(BuildContext context) =>
      SavedProductsViewModel();

  @override
  void onViewModelReady(SavedProductsViewModel viewModel) {
    viewModel.init();
  }
}
