import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'package:weight_mate/ui/views/generate_bill/generate_bill_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'item_row.dart';

class ItemTable extends ViewModelWidget<GenerateBillViewModel> {
  const ItemTable();

  @override
  Widget build(BuildContext context, GenerateBillViewModel viewModel) {
    final b = viewModel.bill;
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
          ...b.items.map((item) => ItemRow(item: item)).toList(),
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
}
