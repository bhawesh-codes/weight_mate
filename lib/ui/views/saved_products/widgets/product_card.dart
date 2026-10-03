import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/base/widgets/text/title_text.dart';
import 'package:weight_mate/models/saved_product.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'package:weight_mate/ui/common/currency_helper.dart';
import 'package:weight_mate/ui/views/saved_products/saved_products_viewmodel.dart';
import 'shared.dart';

class ProductCard extends ViewModelWidget<SavedProductsViewModel> {
  final SavedProduct product;
  const ProductCard({required this.product});

  @override
  Widget build(BuildContext context, SavedProductsViewModel viewModel) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: kcLightBorder),
      ),
      child: Row(
        children: [
          Container(
            width: 48.w,
            height: 48.w,
            decoration: BoxDecoration(
              color: kcPrimaryContainer.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(Icons.inventory_2, color: kcPrimaryColor, size: 24.r),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TitleTextWidget(
                  text: product.name,
                  textType: TextType.small,
                  fontWeight: FontWeight.w600,
                ),
                UIHelper.verticalSpaceXXSmall,
                BodyTextWidget(
                  text: '${formatPrice(product.price)}${priceTypeSuffix(product.priceType)}',
                  textType: TextType.xsmall,
                  color: kcLightSecondaryText,
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.edit_outlined,
                    size: 18.r, color: kcLightSecondaryText),
                onPressed: () => viewModel.editProduct(product),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              IconButton(
                icon: Icon(Icons.delete_outline,
                    size: 18.r, color: kcLightSecondaryText),
                onPressed: () => viewModel.deleteProduct(product.id),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
