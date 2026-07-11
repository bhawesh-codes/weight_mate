import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/app/app.locator.dart';
import 'package:weight_mate/services/storage_service.dart';
import 'package:stacked_services/stacked_services.dart';

class ShopProfileViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _storageService = locator<StorageService>();

  late TextEditingController _nameController;
  late TextEditingController _addressController;
  late TextEditingController _phoneController;

  TextEditingController get nameController => _nameController;
  TextEditingController get addressController => _addressController;
  TextEditingController get phoneController => _phoneController;

  ShopProfileViewModel() {
    _nameController = TextEditingController(text: _storageService.storeName);
    _addressController = TextEditingController(text: _storageService.storeAddress);
    _phoneController = TextEditingController(text: _storageService.storePhone);
  }

  void onBack() {
    _navigationService.back();
  }

  Future<void> save() async {
    await _storageService.saveStoreProfile(
      _nameController.text.trim(),
      _addressController.text.trim(),
      _phoneController.text.trim(),
    );
    _navigationService.back();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}
