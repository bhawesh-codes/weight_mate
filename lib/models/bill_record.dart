import 'package:isar/isar.dart';

part 'bill_record.g.dart';

@collection
class BillRecord {
  Id id = Isar.autoIncrement;

  @Index()
  String billNumber;

  @Index()
  DateTime createdAt;

  String shopName;
  String shopAddress;
  String shopPhone;
  String itemsJson;
  int itemCount;
  double subtotal;
  double tax;
  double grandTotal;

  BillRecord({
    required this.billNumber,
    required this.createdAt,
    required this.shopName,
    required this.shopAddress,
    required this.shopPhone,
    required this.itemsJson,
    required this.itemCount,
    required this.subtotal,
    required this.tax,
    required this.grandTotal,
  });
}
