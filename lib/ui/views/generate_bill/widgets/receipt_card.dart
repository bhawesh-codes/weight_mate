import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'package:weight_mate/ui/views/generate_bill/generate_bill_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'shop_header.dart';
import 'bill_meta.dart';
import 'item_table.dart';
import 'summary.dart';
import 'footer.dart';

class ReceiptCard extends ViewModelWidget<GenerateBillViewModel> {
  const ReceiptCard();

  @override
  Widget build(BuildContext context, GenerateBillViewModel _) {
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
      child: const Column(
        children: [
          ShopHeader(),
          BillMeta(),
          ItemTable(),
          Summary(),
          Footer(),
        ],
      ),
    );
  }
}
