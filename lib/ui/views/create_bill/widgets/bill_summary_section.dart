import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'package:weight_mate/ui/views/create_bill/create_bill_viewmodel.dart';
import 'bill_item_card.dart';

class BillSummarySection extends StatelessWidget {
  final CreateBillViewModel viewModel;

  const BillSummarySection({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const BodyTextWidget(
              text: 'Bill Summary',
              textType: TextType.medium,
              fontWeight: FontWeight.w500,
              color: kcLightPrimaryText,
            ),
            UIHelper.horizontalSpaceSmall,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: kcPrimaryContainer,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: BodyTextWidget(
                text: '${viewModel.itemCount} Items',
                textType: TextType.xxsmall,
                color: kcPrimaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        UIHelper.verticalSpace(12.h),
        if (viewModel.items.isEmpty)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 32.h),
            child: Center(
              child: Column(
                children: [
                  Icon(Icons.playlist_add,
                      size: 48.r, color: kcLightHintText),
                  UIHelper.verticalSpace(12.h),
                  const BodyTextWidget(
                    text: 'No items added yet',
                    textType: TextType.small,
                    color: kcLightSecondaryText,
                  ),
                  UIHelper.verticalSpace(4.h),
                  const BodyTextWidget(
                    text: 'Tap a product above or add a custom item',
                    textType: TextType.xxsmall,
                    color: kcLightHintText,
                  ),
                ],
              ),
            ),
          )
        else
          ...List.generate(viewModel.items.length, (index) {
            final item = viewModel.items[index];
            return BillItemCard(
              item: item,
              onNameChanged: (v) => viewModel.updateItemName(index, v),
              onPriceChanged: (v) => viewModel.updateItemPrice(index, v),
              onUnitChanged: (v) => viewModel.updateItemUnit(index, v),
              onWeightChanged: (v) => viewModel.updateWeight(index, v),
              onWeightUnitChanged: (v) => viewModel.updateWeightUnit(index, v),
              onRemove: () => viewModel.removeItem(index),
            );
          }),
      ],
    );
  }
}
