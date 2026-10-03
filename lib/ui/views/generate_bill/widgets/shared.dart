import 'package:weight_mate/models/calculator_row.dart';

String unitLabel(UnitType unit) {
  switch (unit) {
    case UnitType.kg:
      return 'kg';
    case UnitType.gm:
      return 'gm';
    case UnitType.piece:
      return 'pcs';
    case UnitType.dozen:
      return 'doz';
  }
}

String formatDate(DateTime date) {
  const months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  ];
  final hour =
      date.hour > 12 ? date.hour - 12 : (date.hour == 0 ? 12 : date.hour);
  final amPm = date.hour >= 12 ? 'PM' : 'AM';
  return '${months[date.month - 1]} ${date.day}, ${date.year} • '
      '${hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')} $amPm';
}
