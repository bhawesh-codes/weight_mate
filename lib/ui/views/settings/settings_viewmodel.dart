import 'package:stacked/stacked.dart';
import 'package:weight_mate/app/app.locator.dart';
import 'package:weight_mate/app/app.router.dart';
import 'package:weight_mate/services/storage_service.dart';
import 'package:stacked_services/stacked_services.dart';

class SettingsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _storageService = locator<StorageService>();

  String get appVersion => 'v2.4.1';
  String get storeName => _storageService.storeName;
  String get storeAddress => _storageService.storeAddress;
  String get storePhone => _storageService.storePhone;

  void onBack() {
    _navigationService.back();
  }

  void openShopProfile() async {
    await _navigationService.navigateToShopProfileView();
    notifyListeners();
  }

  void openQrPaymentSetup() {
    _navigationService.navigateToQrPaymentSetupView();
  }

  void openCurrency() {}

  void openLanguage() {}

  void openTheme() {}

  void openBackupRestore() {}

  void openAboutApp() {}

  void openPrivacyPolicy() {}
}
