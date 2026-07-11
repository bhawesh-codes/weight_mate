import 'package:stacked/stacked.dart';
import 'package:weight_mate/app/app.locator.dart';
import 'package:weight_mate/app/app.router.dart';
import 'package:weight_mate/services/storage_service.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _storageService = locator<StorageService>();

  Future runStartupLogic() async {
    await Future.delayed(const Duration(milliseconds: 500));

    if (_storageService.isFirstTime) {
      await _storageService.setFirstTimeDone();
      _navigationService.replaceWithWalkthroughView();
    } else {
      _navigationService.replaceWithHomeView();
    }
  }
}
