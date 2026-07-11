import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:weight_mate/app/app.locator.dart';
import 'package:weight_mate/app/app.router.dart';
import 'package:weight_mate/models/bill.dart';
import 'package:weight_mate/models/bill_item.dart';
import 'package:weight_mate/models/calculator_row.dart';
import 'package:weight_mate/models/saved_product.dart';
import 'package:weight_mate/services/product_service.dart';
import 'package:weight_mate/services/storage_service.dart';

class CreateBillViewModel extends BaseViewModel {
  final _productService = locator<ProductService>();

  final List<BillItem> _items = <BillItem>[];
  String _searchQuery = '';

  List<QuickAddProduct> _quickProducts = [];

  List<BillItem> get items => _items;
  String get searchQuery => _searchQuery;

  double get totalPayable =>
      _items.fold<double>(0, (sum, item) => sum + item.subtotal);

  int get itemCount => _items.length;

  Future<void> init() async {
    final savedProducts = await _productService.getAllProducts();
    _quickProducts = savedProducts.map((p) {
      return QuickAddProduct(
        name: p.name,
        icon: Icons.inventory_2,
        price: p.price,
        unit: _mapPriceType(p.priceType),
      );
    }).toList();
    notifyListeners();
  }

  UnitType _mapPriceType(PriceType type) {
    switch (type) {
      case PriceType.kg:
        return UnitType.kg;
      case PriceType.gm:
        return UnitType.gm;
      case PriceType.piece:
        return UnitType.piece;
      case PriceType.dozen:
        return UnitType.dozen;
    }
  }

  List<QuickAddProduct> get filteredProducts {
    if (_searchQuery.isEmpty) return _quickProducts;
    return _quickProducts
        .where((p) => p.name.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }

  void updateSearch(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void addProduct(QuickAddProduct product) {
    _items.add(BillItem(
      name: product.name,
      price: product.price,
      unit: product.unit,
      isHighlighted: _items.isEmpty,
    ));
    notifyListeners();
  }

  void addCustomItemRow() {
    _items.add(BillItem(
      name: '',
      price: 0,
      unit: UnitType.kg,
      isHighlighted: _items.isEmpty,
      isEditing: true,
    ));
    notifyListeners();
  }

  void removeItem(int index) {
    if (index >= 0 && index < _items.length) {
      _items.removeAt(index);
      notifyListeners();
    }
  }

  void updateItemName(int index, String name) {
    if (index >= 0 && index < _items.length) {
      _items[index].name = name;
    }
  }

  void updateItemPrice(int index, String text) {
    if (index >= 0 && index < _items.length) {
      _items[index].priceText = text;
      _items[index].price = double.tryParse(text) ?? 0;
      _items[index].calculateSubtotal();
      notifyListeners();
    }
  }

  void updateItemUnit(int index, UnitType unit) {
    if (index >= 0 && index < _items.length) {
      _items[index].unit = unit;
      _items[index].calculateSubtotal();
      notifyListeners();
    }
  }

  void updateWeight(int index, String text) {
    if (index >= 0 && index < _items.length) {
      _items[index].weightText = text;
      _items[index].weight = double.tryParse(text) ?? 0;
      _items[index].calculateSubtotal();
      notifyListeners();
    }
  }

  void generateBill() {
    final validItems = _items.where((item) => item.name.isNotEmpty && item.price > 0).toList();
    if (validItems.isEmpty) return;

    final storageService = locator<StorageService>();
    final subtotal = validItems.fold<double>(0, (sum, item) => sum + item.subtotal);
    final now = DateTime.now();
    final bill = Bill(
      billNumber: 'WM-${now.year}-${now.millisecondsSinceEpoch.toString().substring(6)}',
      createdAt: now,
      shopName: storageService.storeName,
      shopAddress: storageService.storeAddress,
      shopPhone: storageService.storePhone,
      items: validItems,
      subtotal: subtotal,
      grandTotal: subtotal,
    );

    locator<NavigationService>().navigateToGenerateBillView(bill: bill);
  }
}
