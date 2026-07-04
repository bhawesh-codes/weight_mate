import 'package:carousel_slider/carousel_slider.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:weight_mate/app/app.locator.dart';
import 'package:weight_mate/app/app.router.dart';

class WalkthroughViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final CarouselSliderController carouselController =
      CarouselSliderController();

  int currentIndex = 0;
  final int totalSlides = 3;

  void onPageChanged(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void onButtonTap() {
    if (currentIndex < totalSlides - 1) {
      carouselController.nextPage();
      // currentIndex updates automatically via onPageChanged
    } else {
      // last slide — navigate to login
      _navigationService.replaceWithHomeView();
    }
  }
}
