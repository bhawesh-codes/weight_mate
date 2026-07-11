import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/app/app.locator.dart';
import 'package:weight_mate/app/app.router.dart';
import 'package:weight_mate/models/bill_record.dart';
import 'package:weight_mate/services/bill_history_service.dart';
import 'package:stacked_services/stacked_services.dart';

enum BillHistoryFilter { all, today, week, month, threeMonths }

class BillHistoryViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _billHistoryService = locator<BillHistoryService>();

  final searchController = TextEditingController();

  List<BillRecord> _allBills = [];
  BillHistoryFilter _selectedFilter = BillHistoryFilter.week;
  String _searchQuery = '';

  BillHistoryFilter get selectedFilter => _selectedFilter;
  List<BillRecord> get allBills => _allBills;

  List<BillRecord> get filteredBills {
    var bills = _allBills;
    final cutoff = _cutoffDate(_selectedFilter);
    if (cutoff != null) {
      bills = bills.where((b) => b.createdAt.isAfter(cutoff)).toList();
    }
    if (_searchQuery.isNotEmpty) {
      bills = bills.where((b) =>
        b.billNumber.toLowerCase().contains(_searchQuery.toLowerCase())
      ).toList();
    }
    return bills;
  }

  DateTime? _cutoffDate(BillHistoryFilter filter) {
    final now = DateTime.now();
    switch (filter) {
      case BillHistoryFilter.all:
        return null;
      case BillHistoryFilter.today:
        return DateTime(now.year, now.month, now.day);
      case BillHistoryFilter.week:
        return now.subtract(const Duration(days: 7));
      case BillHistoryFilter.month:
        return now.subtract(const Duration(days: 30));
      case BillHistoryFilter.threeMonths:
        return now.subtract(const Duration(days: 90));
    }
  }

  String get filterLabel {
    switch (_selectedFilter) {
      case BillHistoryFilter.all:
        return 'All';
      case BillHistoryFilter.today:
        return 'Today';
      case BillHistoryFilter.week:
        return 'Week';
      case BillHistoryFilter.month:
        return 'Month';
      case BillHistoryFilter.threeMonths:
        return '3 Months';
    }
  }

  Future<void> init() async {
    setBusy(true);
    _allBills = await _billHistoryService.getAllBills();
    setBusy(false);
  }

  void onSearch(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void setFilter(BillHistoryFilter filter) {
    _selectedFilter = filter;
    notifyListeners();
  }

  void onBillTap(BillRecord record) {
    final bill = _billHistoryService.toBill(record);
    _navigationService.navigateToGenerateBillView(bill: bill);
  }

  void goBack() {
    _navigationService.back();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
