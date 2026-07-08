import 'package:weight_mate/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:weight_mate/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:weight_mate/ui/views/home/home_view.dart';
import 'package:weight_mate/ui/views/create_bill/create_bill_view.dart';
import 'package:weight_mate/ui/views/generate_bill/generate_bill_view.dart';
import 'package:weight_mate/ui/views/quick_calculator/quick_calculator_view.dart';
import 'package:weight_mate/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
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
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
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
