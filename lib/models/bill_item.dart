import 'package:flutter/material.dart';
import 'calculator_row.dart';

class QuickAddProduct {
  final String name;
  final IconData icon;
  final double price;
  final UnitType unit;

  const QuickAddProduct({
    required this.name,
    required this.icon,
    required this.price,
    this.unit = UnitType.kg,
  });
}

class BillItem {
  String name;
  double price;
  UnitType unit;
  double weight;
  double subtotal;
  bool isHighlighted;
  bool isEditing;
  String priceText;
  String weightText;

  BillItem({
    required this.name,
    required this.price,
    this.unit = UnitType.kg,
    this.weight = 0,
    this.subtotal = 0,
    this.isHighlighted = false,
    this.isEditing = false,
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
}
