import 'dart:convert';

import 'package:isar/isar.dart';
import 'package:weight_mate/app/app.locator.dart' show locator;
import 'package:weight_mate/models/bill.dart';
import 'package:weight_mate/models/bill_item.dart';
import 'package:weight_mate/models/bill_record.dart';
import 'package:weight_mate/services/isar_service.dart';

class BillHistoryService {
  late final IsarService _isarService = locator<IsarService>();

  Isar get _isar => _isarService.isar;

  Future<void> saveBill(Bill bill) async {
    final itemsJson = jsonEncode(
      bill.items.map((item) => item.toJson()).toList(),
    );
    final record = BillRecord(
      billNumber: bill.billNumber,
      createdAt: bill.createdAt,
      shopName: bill.shopName,
      shopAddress: bill.shopAddress,
      shopPhone: bill.shopPhone,
      itemsJson: itemsJson,
      itemCount: bill.itemCount,
      subtotal: bill.subtotal,
      tax: bill.tax,
      grandTotal: bill.grandTotal,
    );
    await _isar.writeTxn(() async {
      await _isar.billRecords.put(record);
    });
  }

  Future<List<BillRecord>> getAllBills() async {
    return _isar.billRecords.where().sortByCreatedAtDesc().findAll();
  }

  Bill toBill(BillRecord record) {
    final items = (jsonDecode(record.itemsJson) as List)
        .map((e) => BillItem.fromJson(e as Map<String, dynamic>))
        .toList();
    return Bill(
      billNumber: record.billNumber,
      createdAt: record.createdAt,
      shopName: record.shopName,
      shopAddress: record.shopAddress,
      shopPhone: record.shopPhone,
      items: items,
      subtotal: record.subtotal,
      tax: record.tax,
      grandTotal: record.grandTotal,
    );
  }
}
