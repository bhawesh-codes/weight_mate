import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:share_plus/share_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/app/app.locator.dart';
import 'package:weight_mate/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:weight_mate/models/bill.dart';
import 'package:weight_mate/models/calculator_row.dart';
import 'package:weight_mate/services/bill_history_service.dart';

class GenerateBillViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  final Bill bill;

  GenerateBillViewModel({required this.bill});

  void goBack() {
    _navigationService.back();
  }

  void deleteBill() {}

  void editBill() {
    _navigationService.navigateToCreateBillView();
  }

  Future<void> doneAndSave() async {
    final service = locator<BillHistoryService>();
    await service.saveBill(bill);
    _navigationService.clearStackAndShow(Routes.homeView);
  }

  void showQR() {
    _navigationService.navigateToScanPayView(grandTotal: bill.grandTotal);
  }

  Future<void> shareBill() async {
    setBusy(true);
    final pdfBytes = await _generatePdf();
    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/bill_${bill.billNumber}.pdf');
    await file.writeAsBytes(pdfBytes);

    await SharePlus.instance.share(
      ShareParams(
        files: [XFile(file.path)],
        subject: 'Bill - ${bill.shopName}',
      ),
    );
    setBusy(false);
  }

  Future<void> downloadPDF() async {
    setBusy(true);
    final pdfBytes = await _generatePdf();
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/bill_${bill.billNumber}.pdf');
    await file.writeAsBytes(pdfBytes);

    await SharePlus.instance.share(
      ShareParams(
        files: [XFile(file.path)],
        subject: 'Bill - ${bill.shopName}',
      ),
    );
    setBusy(false);
  }

  Future<Uint8List> _generatePdf() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        build: (context) {
          return pw.Column(
            children: [
              pw.Center(
                child: pw.Column(
                  children: [
                    pw.Text(
                      bill.shopName,
                      style: pw.TextStyle(
                        fontSize: 22,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.SizedBox(height: 4),
                    pw.Text(
                      bill.shopAddress,
                      style: pw.TextStyle(
                        fontSize: 10,
                        color: PdfColors.grey700,
                      ),
                    ),
                    pw.Text(
                      bill.shopPhone,
                      style: pw.TextStyle(
                        fontSize: 10,
                        color: PdfColors.grey700,
                      ),
                    ),
                  ],
                ),
              ),
              pw.SizedBox(height: 8),
              pw.Divider(),
              pw.SizedBox(height: 8),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text(
                    'Bill #: ${bill.billNumber}',
                    style: pw.TextStyle(fontSize: 11),
                  ),
                  pw.Text(
                    _formatDate(bill.createdAt),
                    style: pw.TextStyle(fontSize: 11),
                  ),
                ],
              ),
              pw.SizedBox(height: 6),
              pw.Container(
                padding: const pw.EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 3,
                ),
                decoration: pw.BoxDecoration(
                  color: PdfColors.green50,
                  borderRadius: pw.BorderRadius.all(
                    pw.Radius.circular(4),
                  ),
                ),
                child: pw.Text(
                  bill.status,
                  style: pw.TextStyle(
                    fontSize: 9,
                    color: PdfColors.green700,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ),
              pw.SizedBox(height: 12),
              pw.Divider(),
              pw.SizedBox(height: 4),
              _tableHeader(),
              ...bill.items.map(_itemRow),
              pw.SizedBox(height: 8),
              pw.Divider(),
              pw.SizedBox(height: 4),
              _totalRow('Subtotal (${bill.itemCount} Items)',
                  bill.subtotal.toStringAsFixed(2)),
              _totalRow('Tax / Service', bill.tax.toStringAsFixed(2)),
              pw.SizedBox(height: 4),
              pw.Divider(),
              pw.SizedBox(height: 4),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text(
                    'Grand Total',
                    style: pw.TextStyle(
                      fontSize: 14,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.Text(
                    '₹ ${bill.grandTotal.toStringAsFixed(2)}',
                    style: pw.TextStyle(
                      fontSize: 16,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.blue700,
                    ),
                  ),
                ],
              ),
              pw.SizedBox(height: 32),
              pw.Center(
                child: pw.Text(
                  'Thank you for shopping with us!',
                  style: pw.TextStyle(
                    fontSize: 11,
                    color: PdfColors.grey700,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );

    return pdf.save();
  }

  pw.Widget _tableHeader() {
    return pw.Container(
      decoration: pw.BoxDecoration(
        color: PdfColors.grey100,
      ),
      padding: pw.EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      child: pw.Row(
        children: [
          pw.Expanded(
            flex: 3,
            child: _headerText('Item'),
          ),
          pw.Expanded(
            flex: 2,
            child: _headerText('Qty', pw.TextAlign.center),
          ),
          pw.Expanded(
            flex: 2,
            child: _headerText('Rate', pw.TextAlign.right),
          ),
          pw.Expanded(
            flex: 2,
            child: _headerText('Total', pw.TextAlign.right),
          ),
        ],
      ),
    );
  }

  pw.Widget _headerText(String text,
      [pw.TextAlign align = pw.TextAlign.start]) {
    return pw.Text(
      text,
      style: pw.TextStyle(
        fontSize: 9,
        fontWeight: pw.FontWeight.bold,
        color: PdfColors.grey700,
      ),
      textAlign: align,
    );
  }

  pw.Widget _itemRow(dynamic item) {
    final unitLabel = _unitLabel(item.unit);
    return pw.Container(
      padding: pw.EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      decoration: pw.BoxDecoration(
        border: pw.Border(
          bottom: pw.BorderSide(
            color: PdfColors.grey300,
            width: 0.5,
          ),
        ),
      ),
      child: pw.Row(
        children: [
          pw.Expanded(
            flex: 3,
            child: pw.Text(
              item.name,
              style: pw.TextStyle(fontSize: 9),
            ),
          ),
          pw.Expanded(
            flex: 2,
            child: pw.Text(
              '${item.weight.toStringAsFixed(3)} $unitLabel',
              style: pw.TextStyle(fontSize: 9),
              textAlign: pw.TextAlign.center,
            ),
          ),
          pw.Expanded(
            flex: 2,
            child: pw.Text(
              item.price.toStringAsFixed(2),
              style: pw.TextStyle(fontSize: 9),
              textAlign: pw.TextAlign.right,
            ),
          ),
          pw.Expanded(
            flex: 2,
            child: pw.Text(
              item.subtotal.toStringAsFixed(2),
              style: pw.TextStyle(
                fontSize: 9,
                fontWeight: pw.FontWeight.bold,
              ),
              textAlign: pw.TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  pw.Widget _totalRow(String label, String value) {
    return pw.Padding(
      padding: pw.EdgeInsets.symmetric(vertical: 2),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text(
            label,
            style: pw.TextStyle(fontSize: 10, color: PdfColors.grey700),
          ),
          pw.Text(
            value,
            style: pw.TextStyle(fontSize: 10),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    final hour = date.hour > 12 ? date.hour - 12 : (date.hour == 0 ? 12 : date.hour);
    final amPm = date.hour >= 12 ? 'PM' : 'AM';
    return '${months[date.month - 1]} ${date.day}, ${date.year} • '
        '${hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')} $amPm';
  }

  String _unitLabel(UnitType unit) {
    switch (unit) {
      case UnitType.kg: return 'kg';
      case UnitType.gm: return 'gm';
      case UnitType.piece: return 'pcs';
      case UnitType.dozen: return 'doz';
    }
  }
}
