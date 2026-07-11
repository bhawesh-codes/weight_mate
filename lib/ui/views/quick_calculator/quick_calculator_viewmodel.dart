import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:weight_mate/app/app.locator.dart';
import 'package:weight_mate/app/app.router.dart';
import 'package:weight_mate/models/bill.dart';
import 'package:weight_mate/models/bill_item.dart';
import 'package:weight_mate/models/calculator_row.dart';
import 'package:weight_mate/services/bill_history_service.dart';
import 'package:weight_mate/services/storage_service.dart';

class QuickCalculatorViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _storageService = locator<StorageService>();
  final _billHistoryService = locator<BillHistoryService>();

  final List<CalculatorRow> _rows = [CalculatorRow()];

  List<CalculatorRow> get rows => _rows;

  double get grandTotal =>
      _rows.fold<double>(0, (sum, row) => sum + row.subtotal);

  void addRow() {
    _rows.add(CalculatorRow());
    notifyListeners();
  }

  void clearAll() {
    _rows.removeRange(1, _rows.length);
    final first = _rows.first;
    first.price = 0;
    first.weight = 0;
    first.unit = UnitType.kg;
    first.subtotal = 0;
    notifyListeners();
  }

  void updatePrice(int index, String text) {
    if (index >= 0 && index < _rows.length) {
      _rows[index].priceText = text;
      _rows[index].price = double.tryParse(text) ?? 0;
      _rows[index].calculateSubtotal();
      notifyListeners();
    }
  }

  void updateWeight(int index, String text) {
    if (index >= 0 && index < _rows.length) {
      _rows[index].weightText = text;
      _rows[index].weight = double.tryParse(text) ?? 0;
      _rows[index].calculateSubtotal();
      notifyListeners();
    }
  }

  void updateUnit(int index, UnitType unit) {
    if (index >= 0 && index < _rows.length) {
      _rows[index].unit = unit;
      _rows[index].calculateSubtotal();
      notifyListeners();
    }
  }

  void showQr() {
    if (grandTotal <= 0) return;
    _navigationService.navigateToScanPayView(grandTotal: grandTotal);
  }

  Future<void> saveToHistory() async {
    final validRows = _rows.where((r) => r.price > 0 && r.weight > 0).toList();
    if (validRows.isEmpty) return;

    final items = validRows.map((r) {
      return BillItem(
        name: '',
        price: r.price,
        unit: r.unit,
        weight: r.weight,
        subtotal: r.subtotal,
      );
    }).toList();

    final now = DateTime.now();
    final bill = Bill(
      billNumber: 'QC-${now.year}-${now.millisecondsSinceEpoch.toString().substring(6)}',
      createdAt: now,
      shopName: _storageService.storeName,
      shopAddress: _storageService.storeAddress,
      shopPhone: _storageService.storePhone,
      items: items,
      subtotal: grandTotal,
      grandTotal: grandTotal,
    );

    await _billHistoryService.saveBill(bill);
  }
}
