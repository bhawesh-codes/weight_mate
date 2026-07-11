import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/app/app.locator.dart';
import 'package:weight_mate/app/app.router.dart';
import 'package:weight_mate/models/saved_product.dart';
import 'package:weight_mate/services/product_service.dart';
import 'package:stacked_services/stacked_services.dart';

class SavedProductsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _productService = locator<ProductService>();

  List<SavedProduct> _allProducts = [];
  final searchController = TextEditingController();
  String _searchQuery = '';

  List<SavedProduct> get filteredProducts {
    if (_searchQuery.isEmpty) return _allProducts;
    return _allProducts
        .where((p) => p.name.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }

  Future<void> init() async {
    setBusy(true);
    _allProducts = await _productService.getAllProducts();
    setBusy(false);
  }

  void onSearch(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  Future<void> deleteProduct(int id) async {
    await _productService.deleteProduct(id);
    _allProducts.removeWhere((p) => p.id == id);
    notifyListeners();
  }

  Future<void> openAddProduct() async {
    await _navigationService.navigateToAddProductView();
    _allProducts = await _productService.getAllProducts();
    notifyListeners();
  }

  Future<void> editProduct(SavedProduct product) async {
    await _navigationService.navigateToAddProductView(product: product);
    _allProducts = await _productService.getAllProducts();
    notifyListeners();
  }

  void goBack() {
    _navigationService.back();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
