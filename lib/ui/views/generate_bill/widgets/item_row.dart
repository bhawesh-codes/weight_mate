import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/base/widgets/text/title_text.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'package:weight_mate/models/bill_item.dart';
import 'shared.dart';

class ItemRow extends StatelessWidget {
  final BillItem item;

  const ItemRow({required this.item});

  @override
  Widget build(BuildContext context) {
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
              text: '${item.weight.toStringAsFixed(3)} ${unitLabel(item.unit)}',
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
}
