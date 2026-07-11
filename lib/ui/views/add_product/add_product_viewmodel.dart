import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/app/app.locator.dart';
import 'package:weight_mate/models/saved_product.dart';
import 'package:weight_mate/services/product_service.dart';
import 'package:stacked_services/stacked_services.dart';

class AddProductViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _productService = locator<ProductService>();

  final SavedProduct? _editingProduct;

  AddProductViewModel({SavedProduct? product}) : _editingProduct = product;

  bool get isEditing => _editingProduct != null;

  late final nameController = TextEditingController(text: _editingProduct?.name ?? '');
  late final priceController = TextEditingController(
    text: _editingProduct != null ? _editingProduct!.price.toString() : '',
  );

  PriceType _selectedPriceType = PriceType.kg;
  PriceType get selectedPriceType =>
      _editingProduct?.priceType ?? _selectedPriceType;

  String? nameError;
  String? priceError;

  void setPriceType(PriceType type) {
    _selectedPriceType = type;
    notifyListeners();
  }

  String get priceTypeLabel {
    switch (selectedPriceType) {
      case PriceType.kg:
        return '/ kg';
      case PriceType.gm:
        return '/ gm';
      case PriceType.piece:
        return '/ piece';
      case PriceType.dozen:
        return '/ dozen';
    }
  }

  void validateAndSave() {
    nameError = null;
    priceError = null;
    final name = nameController.text.trim();
    final priceText = priceController.text.trim();

    if (name.isEmpty) {
      nameError = 'Product name is required';
    }
    if (priceText.isEmpty) {
      priceError = 'Price is required';
    }

    final price = double.tryParse(priceText);
    if (priceText.isNotEmpty && price == null) {
      priceError = 'Enter a valid price';
    }
    if (price != null && price <= 0) {
      priceError = 'Price must be greater than 0';
    }

    if (nameError != null || priceError != null) {
      notifyListeners();
      return;
    }

    _save(name, price!, selectedPriceType);
  }

  Future<void> _save(String name, double price, PriceType priceType) async {
    setBusy(true);
    final product = SavedProduct(
      name: name,
      price: price,
      priceType: priceType,
      createdAt: _editingProduct?.createdAt ?? DateTime.now(),
    );
    if (_editingProduct != null) {
      product.id = _editingProduct!.id;
    }
    await _productService.saveProduct(product);
    setBusy(false);
    _navigationService.back();
  }

  void cancel() {
    _navigationService.back();
  }
}
