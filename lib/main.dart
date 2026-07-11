import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:weight_mate/app/app.bottomsheets.dart';
import 'package:weight_mate/app/app.dialogs.dart';
import 'package:weight_mate/app/app.locator.dart';
import 'package:weight_mate/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:weight_mate/base/utils/app_theme.dart';
import 'package:weight_mate/services/storage_service.dart';
import 'package:weight_mate/services/isar_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  await locator<IsarService>().init();
  await locator<StorageService>().init();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilPlusInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            theme: AppTheme.appThemeLight,
            darkTheme: AppTheme.appThemeDark,
            themeMode: ThemeMode.light,
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.startupView,
            onGenerateRoute: StackedRouter().onGenerateRoute,
            navigatorKey: StackedService.navigatorKey,
            navigatorObservers: [StackedService.routeObserver],
          );
        });
  }
}
