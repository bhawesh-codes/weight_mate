import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/base/widgets/text/title_text.dart';
import 'package:weight_mate/models/bill.dart';
import 'package:weight_mate/models/calculator_row.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'generate_bill_viewmodel.dart';

class GenerateBillView extends StackedView<GenerateBillViewModel> {
  final Bill bill;

  const GenerateBillView({Key? key, required this.bill}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, GenerateBillViewModel viewModel, Widget? child) {
    final b = viewModel.bill;
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        surfaceTintColor: Colors.white,
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: viewModel.goBack,
        ),
        title: const TitleTextWidget(
          text: 'Bill Preview',
          textType: TextType.medium,
          fontWeight: FontWeight.w600,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit_outlined, color: kcLightSecondaryText),
            onPressed: viewModel.goBack,
          ),
          IconButton(
            icon: Icon(Icons.print_outlined, color: kcLightSecondaryText),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 190.h),
        child: _buildReceiptCard(b),
      ),
      bottomSheet: _buildBottomSheet(viewModel, b),
    );
  }

  Widget _buildReceiptCard(Bill b) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: kcLightBorder),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildShopHeader(b),
          _buildBillMeta(b),
          _buildItemTable(b),
          _buildSummary(b),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildShopHeader(Bill b) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 16.h),
      child: Column(
        children: [
          TitleTextWidget(
            text: b.shopName,
            textType: TextType.medium,
            fontWeight: FontWeight.w700,
            color: kcPrimaryColor,
          ),
          UIHelper.verticalSpace(4.h),
          BodyTextWidget(
            text: b.shopAddress,
            textType: TextType.small,
            color: kcLightSecondaryText,
          ),
          UIHelper.verticalSpaceXXSmall,
          BodyTextWidget(
            text: b.shopPhone,
            textType: TextType.xsmall,
            color: kcLightSecondaryText,
          ),
        ],
      ),
    );
  }

  Widget _buildBillMeta(Bill b) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      padding: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: kcLightBorder.withValues(alpha: 0.5)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BodyTextWidget(
                text: 'Bill Number',
                textType: TextType.xsmall,
                color: kcLightSecondaryText,
              ),
              UIHelper.verticalSpaceXXSmall,
              TitleTextWidget(
                text: '#${b.billNumber}',
                textType: TextType.small,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BodyTextWidget(
                text: 'Date',
                textType: TextType.xsmall,
                color: kcLightSecondaryText,
              ),
              UIHelper.verticalSpaceXXSmall,
              TitleTextWidget(
                text: _formatDate(b.createdAt),
                textType: TextType.small,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildItemTable(Bill b) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(flex: 3, child: _tableHeader('Item')),
              Expanded(
                flex: 2,
                child: _tableHeader('Weight', TextAlign.center),
              ),
              Expanded(
                flex: 2,
                child: _tableHeader('Rate', TextAlign.right),
              ),
              Expanded(
                flex: 2,
                child: _tableHeader('Total', TextAlign.right),
              ),
            ],
          ),
          UIHelper.verticalSpace(4.h),
          ...b.items.map(_buildItemRow).toList(),
        ],
      ),
    );
  }

  Widget _tableHeader(String text, [TextAlign align = TextAlign.start]) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: BodyTextWidget(
        text: text,
        textType: TextType.xsmall,
        fontWeight: FontWeight.w600,
        color: kcLightSecondaryText,
        textAlign: align,
      ),
    );
  }

  Widget _buildItemRow(dynamic item) {
    final unitLabel = _unitLabel(item.unit);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: kcLightBorder.withValues(alpha: 0.3),
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: TitleTextWidget(
              text: item.name,
              textType: TextType.small,
              fontWeight: FontWeight.w600,
            ),
          ),
          Expanded(
            flex: 2,
            child: BodyTextWidget(
              text: '${item.weight.toStringAsFixed(3)} $unitLabel',
              textType: TextType.small,
              textAlign: TextAlign.center,
              color: kcLightSecondaryText,
            ),
          ),
          Expanded(
            flex: 2,
            child: BodyTextWidget(
              text: item.price.toStringAsFixed(2),
              textType: TextType.small,
              textAlign: TextAlign.right,
              color: kcLightSecondaryText,
            ),
          ),
          Expanded(
            flex: 2,
            child: BodyTextWidget(
              text: item.subtotal.toStringAsFixed(2),
              textType: TextType.small,
              fontWeight: FontWeight.w700,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  String _unitLabel(UnitType unit) {
    switch (unit) {
      case UnitType.kg:
        return 'kg';
      case UnitType.gm:
        return 'gm';
      case UnitType.piece:
        return 'pcs';
      case UnitType.dozen:
        return 'doz';
    }
  }

  Widget _buildSummary(Bill b) {
    return Container(
      margin: EdgeInsets.fromLTRB(24.w, 20.h, 24.w, 0),
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: kcLightSurfaceVariant,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BodyTextWidget(
                text: 'Total Items',
                textType: TextType.small,
                color: kcLightSecondaryText,
              ),
              TitleTextWidget(
                text: '${b.itemCount}',
                textType: TextType.small,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          UIHelper.verticalSpace(12.h),
          Container(
            padding: EdgeInsets.only(top: 12.h),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: kcLightBorder.withValues(alpha: 0.5),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleTextWidget(
                  text: 'Grand Total',
                  textType: TextType.small,
                  color: kcPrimaryColor,
                  fontWeight: FontWeight.w700,
                ),
                TitleTextWidget(
                  text: '₹ ${b.grandTotal.toStringAsFixed(2)}',
                  textType: TextType.medium,
                  color: kcPrimaryColor,
                  fontWeight: FontWeight.w800,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 24.h),
      child: BodyTextWidget(
        text: 'Thank you for shopping with us!',
        textType: TextType.xsmall,
        color: kcLightSecondaryText,
      ),
    );
  }

  Widget _buildBottomSheet(GenerateBillViewModel viewModel, Bill b) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 30,
            offset: const Offset(0, -8),
          ),
        ],
      ),
      padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 16.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildPayableRow(b, viewModel),
          UIHelper.verticalSpace(8.h),
          _buildActionGrid(viewModel),
          UIHelper.verticalSpace(8.h),
          _buildDoneButton(viewModel),
        ],
      ),
    );
  }

  Widget _buildPayableRow(Bill b, GenerateBillViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BodyTextWidget(
              text: 'PAYABLE AMOUNT',
              textType: TextType.xxsmall,
              fontWeight: FontWeight.w700,
              color: kcLightSecondaryText,
            ),
            UIHelper.verticalSpaceXXSmall,
            TitleTextWidget(
              text: '₹ ${b.grandTotal.toStringAsFixed(2)}',
              textType: TextType.xlarge,
              color: kcPrimaryColor,
              fontWeight: FontWeight.w800,
            ),
          ],
        ),
        SizedBox(
          width: 44.w,
          height: 44.w,
          child: ElevatedButton(
            onPressed: viewModel.showQR,
            style: ElevatedButton.styleFrom(
              backgroundColor: kcPrimaryColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              padding: EdgeInsets.zero,
            ),
            child: Icon(Icons.qr_code_2, size: 24.r),
          ),
        ),
      ],
    );
  }

  Widget _buildActionGrid(GenerateBillViewModel viewModel) {
    return Row(
      children: [
        Expanded(child: _actionItem(Icons.share, 'Share', viewModel.shareBill)),
        UIHelper.horizontalSpaceSmall,
        Expanded(
          child: _actionItem(
            Icons.download,
            'PDF',
            viewModel.downloadPDF,
          ),
        ),
        UIHelper.horizontalSpaceSmall,
        Expanded(
          child: _actionItem(Icons.chat, 'WhatsApp', viewModel.shareBill),
        ),
      ],
    );
  }

  Widget _actionItem(IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          color: kcLightSurfaceVariant,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          children: [
            Icon(icon, color: kcPrimaryColor, size: 20.r),
            UIHelper.verticalSpaceXXSmall,
            BodyTextWidget(
              text: label,
              textType: TextType.xsmall,
              fontWeight: FontWeight.w700,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDoneButton(GenerateBillViewModel viewModel) {
    return SizedBox(
      width: double.infinity,
      height: 48.h,
      child: ElevatedButton(
        onPressed: viewModel.doneAndSave,
        style: ElevatedButton.styleFrom(
          backgroundColor: kcPrimaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28.r),
          ),
          elevation: 8,
          shadowColor: kcPrimaryColor.withValues(alpha: 0.3),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.receipt_long, size: 20.r),
            UIHelper.horizontalSpaceSmall,
            const BodyTextWidget(
              text: 'Done & Save',
              textType: TextType.small,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    final hour =
        date.hour > 12 ? date.hour - 12 : (date.hour == 0 ? 12 : date.hour);
    final amPm = date.hour >= 12 ? 'PM' : 'AM';
    return '${months[date.month - 1]} ${date.day}, ${date.year} • '
        '${hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')} $amPm';
  }

  @override
  GenerateBillViewModel viewModelBuilder(BuildContext context) =>
      GenerateBillViewModel(bill: bill);
}
