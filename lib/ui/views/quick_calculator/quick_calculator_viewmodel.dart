import 'package:stacked/stacked.dart';
import 'package:weight_mate/models/calculator_row.dart';

class QuickCalculatorViewModel extends BaseViewModel {
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
}
