import 'bill_item.dart';

class Bill {
  final String billNumber;
  final DateTime createdAt;
  final String shopName;
  final String shopAddress;
  final String shopPhone;
  final List<BillItem> items;
  final double subtotal;
  final double tax;
  final double grandTotal;
  final String status;

  Bill({
    required this.billNumber,
    required this.createdAt,
    this.shopName = 'Fresh Voggies Store',
    this.shopAddress = 'New Market, Kathmandu',
    this.shopPhone = '9841234567',
    required this.items,
    required this.subtotal,
    this.tax = 0,
    required this.grandTotal,
    this.status = 'PAID',
  });

  int get itemCount => items.length;
}
