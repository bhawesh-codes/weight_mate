import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/base/widgets/text/title_text.dart';
import 'package:weight_mate/models/bill_item.dart';
import 'package:weight_mate/models/calculator_row.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'package:weight_mate/ui/common/currency_helper.dart';
import 'bill_item_editable_header.dart';

class BillItemHeader extends StatelessWidget {
  final BillItem item;
  final String unitLabel;
  final ValueChanged<String> onNameChanged;
  final ValueChanged<String> onPriceChanged;
  final ValueChanged<UnitType> onUnitChanged;
  final VoidCallback onRemove;

  const BillItemHeader({super.key, 
    required this.item,
    required this.unitLabel,
    required this.onNameChanged,
    required this.onPriceChanged,
    required this.onUnitChanged,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: item.isEditing
              ? BillItemEditableHeader(
                  item: item,
                  onNameChanged: onNameChanged,
                  onPriceChanged: onPriceChanged,
                  onUnitChanged: onUnitChanged,
                )
              : _buildStaticHeader(),
        ),
        GestureDetector(
          onTap: onRemove,
          child: Container(
            width: 32.w,
            height: 32.h,
            alignment: Alignment.center,
            child: Icon(
              Icons.close,
              size: 18.r,
              color: kcLightSecondaryText,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStaticHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleTextWidget(
          text: item.name,
          textType: TextType.medium,
          color: kcLightPrimaryText,
          fontWeight: FontWeight.w600,
        ),
        UIHelper.verticalSpaceXXSmall,
        BodyTextWidget(
          text: 'Price: ${formatPrice(item.price)} / $unitLabel',
          textType: TextType.xsmall,
          color: kcLightSecondaryText,
        ),
      ],
    );
  }
}
