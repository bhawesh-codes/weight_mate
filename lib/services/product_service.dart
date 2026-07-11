import 'package:isar/isar.dart';
import 'package:weight_mate/app/app.locator.dart' show locator;
import 'package:weight_mate/models/saved_product.dart';
import 'package:weight_mate/services/isar_service.dart';

class ProductService {
  late final IsarService _isarService = locator<IsarService>();

  Isar get _isar => _isarService.isar;

  Future<void> saveProduct(SavedProduct product) async {
    await _isar.writeTxn(() async {
      await _isar.savedProducts.put(product);
    });
  }

  Future<List<SavedProduct>> getAllProducts() async {
    return _isar.savedProducts.where().sortByName().findAll();
  }

  Future<void> deleteProduct(int id) async {
    await _isar.writeTxn(() async {
      await _isar.savedProducts.delete(id);
    });
  }
}
