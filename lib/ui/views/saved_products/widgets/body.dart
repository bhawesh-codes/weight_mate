import 'package:flutter/material.dart' hide SearchBar;
import 'package:stacked/stacked.dart';
import 'package:weight_mate/ui/views/saved_products/saved_products_viewmodel.dart';
import 'empty_state.dart';
import 'product_list.dart';
import 'search_bar.dart';

class Body extends ViewModelWidget<SavedProductsViewModel> {
  const Body();

  @override
  Widget build(BuildContext context, SavedProductsViewModel viewModel) {
    final products = viewModel.filteredProducts;
    return Column(
      children: [
        const SearchBar(),
        Expanded(
          child: products.isEmpty
              ? const EmptyState()
              : const ProductList(),
        ),
      ],
    );
  }
}
