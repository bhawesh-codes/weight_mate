import 'package:stacked/stacked.dart';
import 'package:weight_mate/app/app.locator.dart';
import 'package:weight_mate/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void openQuickCalculator() {
    _navigationService.navigateToQuickCalculatorView();
  }

  void openCreateBills() {
    _navigationService.navigateToCreateBillView();
  }

  void openProducts() {
    // TODO: navigate to Products view
  }

  void openBillHistory() {
    // TODO: navigate to Bill History view
  }

  void openUploadQr() {
    // TODO: navigate to Upload QR view
  }

  void openSettings() {
    // TODO: navigate to Settings view
  }
}
