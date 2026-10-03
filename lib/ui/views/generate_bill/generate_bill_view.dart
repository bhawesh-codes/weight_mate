import 'package:flutter/material.dart' hide BottomSheet;
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/widgets/text/title_text.dart';
import 'package:weight_mate/models/bill.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'generate_bill_viewmodel.dart';
import 'widgets/bottom_sheet.dart';
import 'widgets/receipt_card.dart';

class GenerateBillView extends StackedView<GenerateBillViewModel> {
  final Bill bill;

  const GenerateBillView({Key? key, required this.bill}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, GenerateBillViewModel viewModel, Widget? child) {
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
        child: const ReceiptCard(),
      ),
      bottomSheet: BottomSheet(b: viewModel.bill),
    );
  }

  @override
  GenerateBillViewModel viewModelBuilder(BuildContext context) =>
      GenerateBillViewModel(bill: bill);
}
