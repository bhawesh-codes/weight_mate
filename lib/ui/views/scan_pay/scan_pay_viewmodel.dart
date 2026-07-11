import 'package:stacked/stacked.dart';
import 'package:weight_mate/app/app.locator.dart';
import 'package:weight_mate/services/storage_service.dart';
import 'package:stacked_services/stacked_services.dart';

class ScanPayViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _storageService = locator<StorageService>();

  final double grandTotal;

  String? get qrCodePath => _storageService.qrCodePath;
  bool get hasQrCode => qrCodePath != null;
  String get storeName => _storageService.storeName;

  ScanPayViewModel({required this.grandTotal});

  void onBack() {
    _navigationService.back();
  }
}
