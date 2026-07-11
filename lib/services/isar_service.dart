import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weight_mate/models/bill_record.dart';
import 'package:weight_mate/models/saved_product.dart';

class IsarService {
  Isar? _isar;

  Future<void> init() async {
    if (_isar != null) return;
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [SavedProductSchema, BillRecordSchema],
      directory: dir.path,
    );
  }

  Isar get isar {
    if (_isar == null) {
      throw StateError('IsarService not initialized. Call init() first.');
    }
    return _isar!;
  }
}
