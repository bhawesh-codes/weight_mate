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
import 'package:weight_mate/ui/views/bill_history/bill_history_view.dart';
import 'package:weight_mate/ui/views/saved_products/saved_products_view.dart';
import 'package:weight_mate/ui/views/add_product/add_product_view.dart';
import 'package:weight_mate/services/bill_history_service.dart';
import 'package:weight_mate/services/isar_service.dart';
import 'package:weight_mate/services/product_service.dart';
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
    MaterialRoute(page: BillHistoryView),
    MaterialRoute(page: SavedProductsView),
    MaterialRoute(page: AddProductView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: StorageService),
    LazySingleton(classType: IsarService),
    LazySingleton(classType: BillHistoryService),
    LazySingleton(classType: ProductService),
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
