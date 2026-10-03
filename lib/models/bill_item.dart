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
  UnitType weightUnit;

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
    this.weightUnit = UnitType.kg,
  });

  void calculateSubtotal() {
    if (unit == UnitType.piece) {
      subtotal = weightUnit == UnitType.dozen
          ? (price * 12) * weight
          : price * weight;
    } else if (unit == UnitType.dozen) {
      subtotal = weightUnit == UnitType.piece
          ? (price / 12) * weight
          : price * weight;
    } else if (weightUnit == UnitType.gm) {
      subtotal = (price / 1000) * weight;
    } else {
      subtotal = price * weight;
    }
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'price': price,
        'unit': unit.index,
        'weight': weight,
        'subtotal': subtotal,
        'weightUnit': weightUnit.index,
      };

  factory BillItem.fromJson(Map<String, dynamic> json) => BillItem(
        name: json['name'] as String,
        price: (json['price'] as num).toDouble(),
        unit: UnitType.values[json['unit'] as int],
        weight: (json['weight'] as num).toDouble(),
        subtotal: (json['subtotal'] as num).toDouble(),
        weightUnit: json['weightUnit'] != null
            ? UnitType.values[json['weightUnit'] as int]
            : UnitType.kg,
      );
}
