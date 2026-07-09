import 'package:weight_mate/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:weight_mate/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:weight_mate/ui/views/home/home_view.dart';
import 'package:weight_mate/ui/views/create_bill/create_bill_view.dart';
import 'package:weight_mate/ui/views/generate_bill/generate_bill_view.dart';
import 'package:weight_mate/ui/views/quick_calculator/quick_calculator_view.dart';
import 'package:weight_mate/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:weight_mate/ui/views/settings/settings_view.dart';
import 'package:weight_mate/services/storage_service.dart';
import 'package:weight_mate/ui/views/qr_payment_setup/qr_payment_setup_view.dart';
import 'package:weight_mate/ui/views/scan_pay/scan_pay_view.dart';
import 'package:weight_mate/ui/views/shop_profile/shop_profile_view.dart';
import 'package:weight_mate/ui/views/walkthrough/walkthrough_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: WalkthroughView),
    MaterialRoute(page: QuickCalculatorView),
    MaterialRoute(page: CreateBillView),
    MaterialRoute(page: GenerateBillView),
    MaterialRoute(page: SettingsView),
    MaterialRoute(page: ShopProfileView),
    MaterialRoute(page: QrPaymentSetupView),
    MaterialRoute(page: ScanPayView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: StorageService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
