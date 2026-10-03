import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/models/calculator_row.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'package:weight_mate/ui/common/currency_helper.dart';
import 'package:weight_mate/ui/views/create_bill/create_bill_viewmodel.dart';

class QuickAddSection extends StatelessWidget {
  final CreateBillViewModel viewModel;

  const QuickAddSection({required this.viewModel});

  String _unitSuffix(UnitType unit) {
    switch (unit) {
      case UnitType.kg:
        return '/kg';
      case UnitType.gm:
        return '/gm';
      case UnitType.piece:
        return '/pc';
      case UnitType.dozen:
        return '/doz';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const BodyTextWidget(
          text: 'Quick Add',
          textType: TextType.medium,
          fontWeight: FontWeight.w500,
          color: kcLightPrimaryText,
        ),
        UIHelper.verticalSpace(12.h),
        SizedBox(
          height: 68.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: viewModel.filteredProducts.length,
            separatorBuilder: (_, __) => UIHelper.horizontalSpaceSmall,
            itemBuilder: (context, index) {
              final product = viewModel.filteredProducts[index];
              return Center(
                child: GestureDetector(
                  onTap: () => viewModel.addProduct(product),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: kcPrimaryContainer,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BodyTextWidget(
                          text: product.name,
                          textType: TextType.small,
                          color: kcPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                        UIHelper.verticalSpaceXXSmall,
                        BodyTextWidget(
                          text:
                              '${formatPrice(product.price)}${_unitSuffix(product.unit)}',
                          textType: TextType.xxsmall,
                          color: kcPrimaryColor.withValues(alpha: 0.7),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
