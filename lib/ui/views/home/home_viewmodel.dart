import 'package:stacked/stacked.dart';
import 'package:weight_mate/app/app.locator.dart';
import 'package:weight_mate/app/app.router.dart';
import 'package:weight_mate/models/bill_record.dart';
import 'package:weight_mate/services/bill_history_service.dart';
import 'package:weight_mate/services/storage_service.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _storageService = locator<StorageService>();
  final _billHistoryService = locator<BillHistoryService>();

  List<BillRecord> _allBills = [];

  String get storeName => _storageService.storeName;
  String get storeAddress => _storageService.storeAddress;
  String get phoneNumber => _storageService.storePhone;

  bool get isStoreDefault =>
      storeName == 'Fresh Voggies Store' &&
      storeAddress == 'New Market, Kathmandu';

  String get displayName => isStoreDefault ? 'Your Store Name' : storeName;
  String get displayAddress =>
      isStoreDefault ? 'your location' : storeAddress;

  String get greeting {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good Morning';
    if (hour < 17) return 'Good Afternoon';
    return 'Good Evening';
  }

  String get todayDate {
    final now = DateTime.now();
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    const days = [
      'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'
    ];
    final day = days[now.weekday - 1];
    final month = months[now.month - 1];
    return '$day, $month ${now.day}';
  }

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  int get todayBillCount => _allBills.where((b) => _isSameDay(b.createdAt, DateTime.now())).length;

  double get todayRevenue => _allBills
      .where((b) => _isSameDay(b.createdAt, DateTime.now()))
      .fold<double>(0, (sum, b) => sum + b.grandTotal);

  int get yesterdayBillCount {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return _allBills.where((b) => _isSameDay(b.createdAt, yesterday)).length;
  }

  double get yesterdayRevenue {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return _allBills
        .where((b) => _isSameDay(b.createdAt, yesterday))
        .fold<double>(0, (sum, b) => sum + b.grandTotal);
  }

  int get billCountChange => todayBillCount - yesterdayBillCount;
  double get revenueChange => todayRevenue - yesterdayRevenue;

  int get totalProducts => 0; // TODO: add product count

  Future<void> init() async {
    _allBills = await _billHistoryService.getAllBills();
    notifyListeners();
  }

  void openShopProfile() {
    _navigationService.navigateToShopProfileView();
  }

  void openQuickCalculator() {
    _navigationService.navigateToQuickCalculatorView();
  }

  void openCreateBills() {
    _navigationService.navigateToCreateBillView();
  }

  void openProducts() {
    _navigationService.navigateToSavedProductsView();
  }

  void openBillHistory() {
    _navigationService.navigateToBillHistoryView();
  }

  void openUploadQr() {
    _navigationService.navigateToQrPaymentSetupView();
  }

  void openSettings() {
    _navigationService.navigateToSettingsView();
  }
}
