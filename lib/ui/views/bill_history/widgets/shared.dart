import 'package:weight_mate/models/bill_record.dart';

class DateGroupKey {
  final String label;
  final DateTime date;

  DateGroupKey({required this.label, required this.date});

  @override
  bool operator ==(Object other) =>
      other is DateGroupKey && date == other.date;

  @override
  int get hashCode => date.hashCode;
}

Map<DateGroupKey, List<BillRecord>> groupBills(List<BillRecord> bills) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = today.subtract(const Duration(days: 1));

  final groups = <DateGroupKey, List<BillRecord>>{};
  for (final bill in bills) {
    final billDate = DateTime(
      bill.createdAt.year,
      bill.createdAt.month,
      bill.createdAt.day,
    );
    DateGroupKey key;
    if (billDate == today) {
      key = DateGroupKey(
        label: 'TODAY, ${formatDate(bill.createdAt)}',
        date: billDate,
      );
    } else if (billDate == yesterday) {
      key = DateGroupKey(
        label: 'YESTERDAY, ${formatDate(bill.createdAt)}',
        date: billDate,
      );
    } else {
      key = DateGroupKey(
        label: formatHeaderDate(bill.createdAt),
        date: billDate,
      );
    }
    groups.putIfAbsent(key, () => []);
    groups[key]!.add(bill);
  }

  final sorted = groups.entries.toList()
    ..sort((a, b) => b.key.date.compareTo(a.key.date));
  return {for (final e in sorted) e.key: e.value};
}

String formatTime(DateTime date) {
  final hour =
      date.hour > 12 ? date.hour - 12 : (date.hour == 0 ? 12 : date.hour);
  final amPm = date.hour >= 12 ? 'PM' : 'AM';
  return '${hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')} $amPm';
}

String formatDate(DateTime date) {
  const months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  ];
  return '${months[date.month - 1]} ${date.day}';
}

String formatHeaderDate(DateTime date) {
  const months = [
    'JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN',
    'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC'
  ];
  return '${months[date.month - 1]} ${date.day}, ${date.year}';
}
