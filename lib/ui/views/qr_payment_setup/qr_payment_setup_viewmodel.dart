import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/app/app.locator.dart';
import 'package:weight_mate/services/storage_service.dart';
import 'package:stacked_services/stacked_services.dart';

class QrPaymentSetupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _storageService = locator<StorageService>();
  final _picker = ImagePicker();

  String? get qrCodePath => _storageService.qrCodePath;
  bool get hasQrCode => qrCodePath != null;

  void onBack() {
    _navigationService.back();
  }

  Future<void> pickFromGallery() async {
    final picked = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1024,
      maxHeight: 1024,
    );
    if (picked != null) {
      await _storageService.saveQrCodePath(picked.path);
      notifyListeners();
    }
  }

  Future<void> removeQr() async {
    await _storageService.removeQrCode();
    notifyListeners();
  }
}
