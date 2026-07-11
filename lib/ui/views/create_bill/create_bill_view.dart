import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/base/widgets/text/title_text.dart';
import 'package:weight_mate/models/bill_item.dart';
import 'package:weight_mate/models/calculator_row.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'create_bill_viewmodel.dart';

import 'package:weight_mate/base/utils/ui_helper.dart';

class CreateBillView extends StackedView<CreateBillViewModel> {
  const CreateBillView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, CreateBillViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        surfaceTintColor: Colors.white,
        titleSpacing: 0,
        title: Row(
          children: [
            UIHelper.horizontalSpaceMedium,
            Icon(Icons.storefront, color: kcPrimaryColor, size: 28.r),
            UIHelper.horizontalSpaceSmall,
            const TitleTextWidget(
              text: 'WeightMate',
              color: kcPrimaryColor,
              textType: TextType.medium,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
        actions: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.w),
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kcLightSurfaceVariant,
            ),
            child: Icon(Icons.search, size: 20.r, color: kcLightSecondaryText),
          ),
          UIHelper.horizontalSpaceSmall,
        ],
      ),
      body: _BillBodyWithScroll(viewModel: viewModel),
      bottomSheet: _buildBottomBar(viewModel),
    );
  }

  Widget _buildBottomBar(CreateBillViewModel viewModel) {
    return Container(
      decoration: BoxDecoration(
        color: kcLightSurfaceVariant,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.r),
          topRight: Radius.circular(32.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 30,
            offset: const Offset(0, -8),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 8.h),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BodyTextWidget(
                      text: 'Total Payable',
                      textType: TextType.xsmall,
                      color: kcLightSecondaryText,
                    ),
                    Text(
                      '₹${viewModel.totalPayable.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w700,
                        color: kcPrimaryColor,
                        letterSpacing: -0.02,
                      ),
                    ),
                  ],
                ),
              ),
              UIHelper.horizontalSpaceMedium,
              Expanded(
                child: SizedBox(
                  height: 56.h,
                  child: ElevatedButton.icon(
                    onPressed: viewModel.generateBill,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kcPrimaryColor,
                      foregroundColor: Colors.white,
                      elevation: 4,
                      shadowColor: kcPrimaryColor.withValues(alpha: 0.2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28.r),
                      ),
                    ),
                    icon: const Icon(Icons.receipt, size: 20),
                    label: const BodyTextWidget(
                      text: 'Generate Bill',
                      textType: TextType.small,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  CreateBillViewModel viewModelBuilder(BuildContext context) =>
      CreateBillViewModel();

  @override
  void onViewModelReady(CreateBillViewModel viewModel) {
    viewModel.init();
  }
}

class _BillBodyWithScroll extends StatefulWidget {
  final CreateBillViewModel viewModel;

  const _BillBodyWithScroll({required this.viewModel});

  @override
  State<_BillBodyWithScroll> createState() => _BillBodyWithScrollState();
}

class _BillBodyWithScrollState extends State<_BillBodyWithScroll> {
  final _scrollController = ScrollController();
  int _prevItemCount = 0;

  @override
  void initState() {
    super.initState();
    widget.viewModel.addListener(_onItemsChanged);
    _prevItemCount = widget.viewModel.items.length;
  }

  @override
  void dispose() {
    widget.viewModel.removeListener(_onItemsChanged);
    _scrollController.dispose();
    super.dispose();
  }

  void _onItemsChanged() {
    final currentCount = widget.viewModel.items.length;
    if (currentCount > _prevItemCount && currentCount > 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    }
    _prevItemCount = currentCount;
  }

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
    return ListView(
      controller: _scrollController,
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 160.h),
      children: [
        _buildQuickAddSection(),
        UIHelper.verticalSpace(24.h),
        _buildBillSummarySection(),
      ],
    );
  }

  Widget _buildQuickAddSection() {
    final viewModel = widget.viewModel;
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
                          text: '₹${product.price.toStringAsFixed(2)}${_unitSuffix(product.unit)}',
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

  Widget _buildBillSummarySection() {
    final viewModel = widget.viewModel;
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
                  Icon(Icons.playlist_add, size: 48.r, color: kcLightHintText),
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
            return _BillItemCard(
              item: item,
              onNameChanged: (v) => viewModel.updateItemName(index, v),
              onPriceChanged: (v) => viewModel.updateItemPrice(index, v),
              onUnitChanged: (v) => viewModel.updateItemUnit(index, v),
              onWeightChanged: (v) => viewModel.updateWeight(index, v),
              onRemove: () => viewModel.removeItem(index),
            );
          }),
        UIHelper.verticalSpaceMedium,
        _buildAddCustomItemButton(),
      ],
    );
  }

  Widget _buildAddCustomItemButton() {
    return GestureDetector(
      onTap: widget.viewModel.addCustomItemRow,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          border: Border.all(
            color: kcLightBorder,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_circle_outline,
                color: kcPrimaryColor, size: 20.r),
            UIHelper.horizontalSpaceSmall,
            const BodyTextWidget(
              text: 'Add Custom Item',
              textType: TextType.small,
              color: kcPrimaryColor,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}

class _BillItemCard extends StatelessWidget {
  final BillItem item;
  final ValueChanged<String> onNameChanged;
  final ValueChanged<String> onPriceChanged;
  final ValueChanged<UnitType> onUnitChanged;
  final ValueChanged<String> onWeightChanged;
  final VoidCallback onRemove;

  const _BillItemCard({
    required this.item,
    required this.onNameChanged,
    required this.onPriceChanged,
    required this.onUnitChanged,
    required this.onWeightChanged,
    required this.onRemove,
  });

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

  @override
  Widget build(BuildContext context) {
    final unitLabel = _unitLabel(item.unit);

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: kcLightBorder),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: item.isEditing
                    ? _buildEditableHeader()
                    : _buildStaticHeader(unitLabel),
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
          ),
          UIHelper.verticalSpace(12.h),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BodyTextWidget(
text: 'Weight',
                    textType: TextType.xsmall,
                    color: kcLightSecondaryText,
                  ),
                  UIHelper.verticalSpace(4.h),
                    Container(
                      decoration: BoxDecoration(
                        color: kcLightSurfaceVariant,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: TextEditingController.fromValue(
                                TextEditingValue(
                                  text: item.weightText,
                                  selection: TextSelection.collapsed(
                                    offset: item.weightText.length,
                                  ),
                                ),
                              ),
                              onChanged: onWeightChanged,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 10),
                              ),
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                                color: kcLightPrimaryText,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            height: 40.h,
                            alignment: Alignment.center,
                            child: BodyTextWidget(
                              text: unitLabel,
                              textType: TextType.xsmall,
                              color: kcPrimaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const BodyTextWidget(
                    text: 'Subtotal',
                    textType: TextType.xsmall,
                    color: kcLightSecondaryText,
                  ),
                  UIHelper.verticalSpace(4.h),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerRight,
                    child: Text(
                      '₹${item.subtotal.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                        color: kcPrimaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStaticHeader(String unitLabel) {
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
          text: 'Price: ₹${item.price.toStringAsFixed(2)} / $unitLabel',
          textType: TextType.xsmall,
          color: kcLightSecondaryText,
        ),
      ],
    );
  }

  Widget _buildEditableHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 44.h,
          child: TextField(
            controller: TextEditingController.fromValue(
              TextEditingValue(
                text: item.name,
                selection: TextSelection.collapsed(offset: item.name.length),
              ),
            ),
            onChanged: onNameChanged,
            decoration: InputDecoration(
              hintText: 'Item name',
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
              hintStyle: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16.sp,
                color: kcLightSecondaryText,
              ),
            ),
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: kcLightPrimaryText,
            ),
          ),
        ),
        UIHelper.verticalSpace(8.h),
        Row(
          children: [
            SizedBox(
              width: 120.w,
              child: SizedBox(
                height: 44.h,
                child: TextField(
                  controller: TextEditingController.fromValue(
                    TextEditingValue(
                      text: item.priceText,
                      selection: TextSelection.collapsed(
                          offset: item.priceText.length),
                    ),
                  ),
                  onChanged: onPriceChanged,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    hintText: 'Price',
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                    hintStyle: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14.sp,
                      color: kcLightSecondaryText,
                    ),
                  ),
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: kcLightPrimaryText,
                  ),
                ),
              ),
            ),
            UIHelper.horizontalSpaceSmall,
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: UnitType.values.map((unit) {
                    final isSelected = item.unit == unit;
                    return GestureDetector(
                      onTap: () => onUnitChanged(unit),
                      child: Container(
                        margin: EdgeInsets.only(right: 4.w),
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 6.h),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? kcPrimaryContainer
                              : Colors.transparent,
                          border: Border.all(color: kcLightBorder),
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: BodyTextWidget(
                          text: unit.name,
                          textType: TextType.xxsmall,
                          color: isSelected
                              ? kcPrimaryColor
                              : kcLightSecondaryText,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
