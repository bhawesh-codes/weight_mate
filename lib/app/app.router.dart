// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i15;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i18;
import 'package:weight_mate/models/bill.dart' as _i16;
import 'package:weight_mate/models/saved_product.dart' as _i17;
import 'package:weight_mate/ui/views/add_product/add_product_view.dart' as _i14;
import 'package:weight_mate/ui/views/bill_history/bill_history_view.dart'
    as _i12;
import 'package:weight_mate/ui/views/create_bill/create_bill_view.dart' as _i6;
import 'package:weight_mate/ui/views/generate_bill/generate_bill_view.dart'
    as _i7;
import 'package:weight_mate/ui/views/home/home_view.dart' as _i2;
import 'package:weight_mate/ui/views/qr_payment_setup/qr_payment_setup_view.dart'
    as _i10;
import 'package:weight_mate/ui/views/quick_calculator/quick_calculator_view.dart'
    as _i5;
import 'package:weight_mate/ui/views/saved_products/saved_products_view.dart'
    as _i13;
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

  static const billHistoryView = '/bill-history-view';

  static const savedProductsView = '/saved-products-view';

  static const addProductView = '/add-product-view';

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
    billHistoryView,
    savedProductsView,
    addProductView,
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
    _i1.RouteDef(
      Routes.billHistoryView,
      page: _i12.BillHistoryView,
    ),
    _i1.RouteDef(
      Routes.savedProductsView,
      page: _i13.SavedProductsView,
    ),
    _i1.RouteDef(
      Routes.addProductView,
      page: _i14.AddProductView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.WalkthroughView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.WalkthroughView(),
        settings: data,
      );
    },
    _i5.QuickCalculatorView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.QuickCalculatorView(),
        settings: data,
      );
    },
    _i6.CreateBillView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.CreateBillView(),
        settings: data,
      );
    },
    _i7.GenerateBillView: (data) {
      final args = data.getArgs<GenerateBillViewArguments>(nullOk: false);
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i7.GenerateBillView(key: args.key, bill: args.bill),
        settings: data,
      );
    },
    _i8.SettingsView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.SettingsView(),
        settings: data,
      );
    },
    _i9.ShopProfileView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.ShopProfileView(),
        settings: data,
      );
    },
    _i10.QrPaymentSetupView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.QrPaymentSetupView(),
        settings: data,
      );
    },
    _i11.ScanPayView: (data) {
      final args = data.getArgs<ScanPayViewArguments>(nullOk: false);
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i11.ScanPayView(key: args.key, grandTotal: args.grandTotal),
        settings: data,
      );
    },
    _i12.BillHistoryView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.BillHistoryView(),
        settings: data,
      );
    },
    _i13.SavedProductsView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.SavedProductsView(),
        settings: data,
      );
    },
    _i14.AddProductView: (data) {
      final args = data.getArgs<AddProductViewArguments>(
        orElse: () => const AddProductViewArguments(),
      );
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i14.AddProductView(key: args.key, product: args.product),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class GenerateBillViewArguments {
  const GenerateBillViewArguments({
    this.key,
    required this.bill,
  });

  final _i15.Key? key;

  final _i16.Bill bill;

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

class ScanPayViewArguments {
  const ScanPayViewArguments({
    this.key,
    required this.grandTotal,
  });

  final _i15.Key? key;

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

class AddProductViewArguments {
  const AddProductViewArguments({
    this.key,
    this.product,
  });

  final _i15.Key? key;

  final _i17.SavedProduct? product;

  @override
  String toString() {
    return '{"key": "$key", "product": "$product"}';
  }

  @override
  bool operator ==(covariant AddProductViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.product == product;
  }

  @override
  int get hashCode {
    return key.hashCode ^ product.hashCode;
  }
}

extension NavigatorStateExtension on _i18.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToWalkthroughView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.walkthroughView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToQuickCalculatorView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.quickCalculatorView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreateBillView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.createBillView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToGenerateBillView({
    _i15.Key? key,
    required _i16.Bill bill,
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

  Future<dynamic> navigateToSettingsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.settingsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToShopProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.shopProfileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToQrPaymentSetupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.qrPaymentSetupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToScanPayView({
    _i15.Key? key,
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

  Future<dynamic> navigateToBillHistoryView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.billHistoryView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSavedProductsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.savedProductsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddProductView({
    _i15.Key? key,
    _i17.SavedProduct? product,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.addProductView,
        arguments: AddProductViewArguments(key: key, product: product),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithWalkthroughView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.walkthroughView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithQuickCalculatorView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.quickCalculatorView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCreateBillView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.createBillView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithGenerateBillView({
    _i15.Key? key,
    required _i16.Bill bill,
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

  Future<dynamic> replaceWithSettingsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.settingsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithShopProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.shopProfileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithQrPaymentSetupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.qrPaymentSetupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithScanPayView({
    _i15.Key? key,
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

  Future<dynamic> replaceWithBillHistoryView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.billHistoryView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSavedProductsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.savedProductsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddProductView({
    _i15.Key? key,
    _i17.SavedProduct? product,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.addProductView,
        arguments: AddProductViewArguments(key: key, product: product),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
