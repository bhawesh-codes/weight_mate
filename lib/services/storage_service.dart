import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const _storeNameKey = 'store_name';
  static const _storeAddressKey = 'store_address';
  static const _storePhoneKey = 'store_phone';
  static const _qrCodePathKey = 'qr_code_path';
  static const _isFirstTimeKey = 'is_first_time';

  String _storeName = 'Your Store Name';
  String _storeAddress = 'Your Location';
  String _storePhone = '9841234567';
  String? _qrCodePath;
  bool _isFirstTime = true;

  String get storeName => _storeName;
  String get storeAddress => _storeAddress;
  String get storePhone => _storePhone;
  String? get qrCodePath => _qrCodePath;
  bool get isFirstTime => _isFirstTime;

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    _storeName = prefs.getString(_storeNameKey) ?? _storeName;
    _storeAddress = prefs.getString(_storeAddressKey) ?? _storeAddress;
    _storePhone = prefs.getString(_storePhoneKey) ?? _storePhone;
    _qrCodePath = prefs.getString(_qrCodePathKey);
    _isFirstTime = prefs.getBool(_isFirstTimeKey) ?? true;
  }

  Future<void> setFirstTimeDone() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isFirstTimeKey, false);
    _isFirstTime = false;
  }

  Future<void> saveStoreProfile(
      String name, String address, String phone) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_storeNameKey, name);
    await prefs.setString(_storeAddressKey, address);
    await prefs.setString(_storePhoneKey, phone);
    _storeName = name;
    _storeAddress = address;
    _storePhone = phone;
  }

  Future<void> saveQrCodePath(String path) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_qrCodePathKey, path);
    _qrCodePath = path;
  }

  Future<void> removeQrCode() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_qrCodePathKey);
    _qrCodePath = null;
  }
}
