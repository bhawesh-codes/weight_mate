// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i12;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i14;
import 'package:weight_mate/models/bill.dart' as _i13;
import 'package:weight_mate/ui/views/create_bill/create_bill_view.dart' as _i6;
import 'package:weight_mate/ui/views/generate_bill/generate_bill_view.dart'
    as _i7;
import 'package:weight_mate/ui/views/home/home_view.dart' as _i2;
import 'package:weight_mate/ui/views/qr_payment_setup/qr_payment_setup_view.dart'
    as _i10;
import 'package:weight_mate/ui/views/quick_calculator/quick_calculator_view.dart'
    as _i5;
import 'package:weight_mate/ui/views/scan_pay/scan_pay_view.dart' as _i11;
import 'package:weight_mate/ui/views/settings/settings_view.dart' as _i8;
import 'package:weight_mate/ui/views/shop_profile/shop_profile_view.dart'
    as _i9;
import 'package:weight_mate/ui/views/startup/startup_view.dart' as _i3;
import 'package:weight_mate/ui/views/walkthrough/walkthrough_view.dart' as _i4;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const walkthroughView = '/walkthrough-view';

  static const quickCalculatorView = '/quick-calculator-view';

  static const createBillView = '/create-bill-view';

  static const generateBillView = '/generate-bill-view';

  static const settingsView = '/settings-view';

  static const shopProfileView = '/shop-profile-view';

  static const qrPaymentSetupView = '/qr-payment-setup-view';

  static const scanPayView = '/scan-pay-view';

  static const all = <String>{
    homeView,
    startupView,
    walkthroughView,
    quickCalculatorView,
    createBillView,
    generateBillView,
    settingsView,
    shopProfileView,
    qrPaymentSetupView,
    scanPayView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.walkthroughView,
      page: _i4.WalkthroughView,
    ),
    _i1.RouteDef(
      Routes.quickCalculatorView,
      page: _i5.QuickCalculatorView,
    ),
    _i1.RouteDef(
      Routes.createBillView,
      page: _i6.CreateBillView,
    ),
    _i1.RouteDef(
      Routes.generateBillView,
      page: _i7.GenerateBillView,
    ),
    _i1.RouteDef(
      Routes.settingsView,
      page: _i8.SettingsView,
    ),
    _i1.RouteDef(
      Routes.shopProfileView,
      page: _i9.ShopProfileView,
    ),
    _i1.RouteDef(
      Routes.qrPaymentSetupView,
      page: _i10.QrPaymentSetupView,
    ),
    _i1.RouteDef(
      Routes.scanPayView,
      page: _i11.ScanPayView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      final args = data.getArgs<HomeViewArguments>(
        orElse: () => const HomeViewArguments(),
      );
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.HomeView(key: args.key),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      final args = data.getArgs<StartupViewArguments>(
        orElse: () => const StartupViewArguments(),
      );
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => _i3.StartupView(key: args.key),
        settings: data,
      );
    },
    _i4.WalkthroughView: (data) {
      final args = data.getArgs<WalkthroughViewArguments>(
        orElse: () => const WalkthroughViewArguments(),
      );
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => _i4.WalkthroughView(key: args.key),
        settings: data,
      );
    },
    _i5.QuickCalculatorView: (data) {
      final args = data.getArgs<QuickCalculatorViewArguments>(
        orElse: () => const QuickCalculatorViewArguments(),
      );
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => _i5.QuickCalculatorView(key: args.key),
        settings: data,
      );
    },
    _i6.CreateBillView: (data) {
      final args = data.getArgs<CreateBillViewArguments>(
        orElse: () => const CreateBillViewArguments(),
      );
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => _i6.CreateBillView(key: args.key),
        settings: data,
      );
    },
    _i7.GenerateBillView: (data) {
      final args = data.getArgs<GenerateBillViewArguments>(nullOk: false);
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i7.GenerateBillView(key: args.key, bill: args.bill),
        settings: data,
      );
    },
    _i8.SettingsView: (data) {
      final args = data.getArgs<SettingsViewArguments>(
        orElse: () => const SettingsViewArguments(),
      );
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => _i8.SettingsView(key: args.key),
        settings: data,
      );
    },
    _i9.ShopProfileView: (data) {
      final args = data.getArgs<ShopProfileViewArguments>(
        orElse: () => const ShopProfileViewArguments(),
      );
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => _i9.ShopProfileView(key: args.key),
        settings: data,
      );
    },
    _i10.QrPaymentSetupView: (data) {
      final args = data.getArgs<QrPaymentSetupViewArguments>(
        orElse: () => const QrPaymentSetupViewArguments(),
      );
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => _i10.QrPaymentSetupView(key: args.key),
        settings: data,
      );
    },
    _i11.ScanPayView: (data) {
      final args = data.getArgs<ScanPayViewArguments>(nullOk: false);
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i11.ScanPayView(key: args.key, grandTotal: args.grandTotal),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class HomeViewArguments {
  const HomeViewArguments({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant HomeViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class StartupViewArguments {
  const StartupViewArguments({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant StartupViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class WalkthroughViewArguments {
  const WalkthroughViewArguments({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant WalkthroughViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class QuickCalculatorViewArguments {
  const QuickCalculatorViewArguments({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant QuickCalculatorViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class CreateBillViewArguments {
  const CreateBillViewArguments({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant CreateBillViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class GenerateBillViewArguments {
  const GenerateBillViewArguments({
    this.key,
    required this.bill,
  });

  final _i12.Key? key;

  final _i13.Bill bill;

  @override
  String toString() {
    return '{"key": "$key", "bill": "$bill"}';
  }

  @override
  bool operator ==(covariant GenerateBillViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.bill == bill;
  }

  @override
  int get hashCode {
    return key.hashCode ^ bill.hashCode;
  }
}

class SettingsViewArguments {
  const SettingsViewArguments({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant SettingsViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class ShopProfileViewArguments {
  const ShopProfileViewArguments({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant ShopProfileViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class QrPaymentSetupViewArguments {
  const QrPaymentSetupViewArguments({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant QrPaymentSetupViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class ScanPayViewArguments {
  const ScanPayViewArguments({
    this.key,
    required this.grandTotal,
  });

  final _i12.Key? key;

  final double grandTotal;

  @override
  String toString() {
    return '{"key": "$key", "grandTotal": "$grandTotal"}';
  }

  @override
  bool operator ==(covariant ScanPayViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.grandTotal == grandTotal;
  }

  @override
  int get hashCode {
    return key.hashCode ^ grandTotal.hashCode;
  }
}

extension NavigatorStateExtension on _i14.NavigationService {
  Future<dynamic> navigateToHomeView({
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.homeView,
        arguments: HomeViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView({
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.startupView,
        arguments: StartupViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToWalkthroughView({
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.walkthroughView,
        arguments: WalkthroughViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToQuickCalculatorView({
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.quickCalculatorView,
        arguments: QuickCalculatorViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreateBillView({
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.createBillView,
        arguments: CreateBillViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToGenerateBillView({
    _i12.Key? key,
    required _i13.Bill bill,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.generateBillView,
        arguments: GenerateBillViewArguments(key: key, bill: bill),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSettingsView({
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.settingsView,
        arguments: SettingsViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToShopProfileView({
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.shopProfileView,
        arguments: ShopProfileViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToQrPaymentSetupView({
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.qrPaymentSetupView,
        arguments: QrPaymentSetupViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToScanPayView({
    _i12.Key? key,
    required double grandTotal,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.scanPayView,
        arguments: ScanPayViewArguments(key: key, grandTotal: grandTotal),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView({
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.homeView,
        arguments: HomeViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView({
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.startupView,
        arguments: StartupViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithWalkthroughView({
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.walkthroughView,
        arguments: WalkthroughViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithQuickCalculatorView({
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.quickCalculatorView,
        arguments: QuickCalculatorViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCreateBillView({
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.createBillView,
        arguments: CreateBillViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithGenerateBillView({
    _i12.Key? key,
    required _i13.Bill bill,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.generateBillView,
        arguments: GenerateBillViewArguments(key: key, bill: bill),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSettingsView({
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.settingsView,
        arguments: SettingsViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithShopProfileView({
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.shopProfileView,
        arguments: ShopProfileViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithQrPaymentSetupView({
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.qrPaymentSetupView,
        arguments: QrPaymentSetupViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithScanPayView({
    _i12.Key? key,
    required double grandTotal,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.scanPayView,
        arguments: ScanPayViewArguments(key: key, grandTotal: grandTotal),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
