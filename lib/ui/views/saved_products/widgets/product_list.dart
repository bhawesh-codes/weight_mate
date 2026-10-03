import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/ui/views/saved_products/saved_products_viewmodel.dart';
import 'product_card.dart';

class ProductList extends ViewModelWidget<SavedProductsViewModel> {
  const ProductList();

  @override
  Widget build(BuildContext context, SavedProductsViewModel viewModel) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      itemCount: viewModel.filteredProducts.length,
      itemBuilder: (context, index) {
        final product = viewModel.filteredProducts[index];
        return ProductCard(product: product);
      },
    );
  }
}
