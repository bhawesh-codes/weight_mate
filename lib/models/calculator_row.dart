enum UnitType { kg, gm, piece, dozen }

class CalculatorRow {
  double price;
  double weight;
  UnitType unit;
  double subtotal;
  String priceText;
  String weightText;

  CalculatorRow({
    this.price = 0,
    this.weight = 0,
    this.unit = UnitType.kg,
    this.subtotal = 0,
    this.priceText = '',
    this.weightText = '',
  });

  void calculateSubtotal() {
    subtotal = switch (unit) {
      UnitType.kg => price * weight,
      UnitType.gm => (price / 1000) * weight,
      UnitType.piece => price * weight,
      UnitType.dozen => price * weight,
    };
  }

  CalculatorRow copy() => CalculatorRow(
        price: price,
        weight: weight,
        unit: unit,
        subtotal: subtotal,
        priceText: priceText,
        weightText: weightText,
      );
}
