import 'package:weight_mate/app/app.locator.dart';
import 'package:weight_mate/services/storage_service.dart';

StorageService get _storage => locator<StorageService>();

String get currencySymbol => _storage.currencySymbol;

String get currencyCode => _storage.currencyCode;

String get currencyName => _storage.currencyName;

String formatPrice(double amount) => _storage.formatPrice(amount);
