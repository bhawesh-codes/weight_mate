import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/widgets/text/title_text.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'create_bill_viewmodel.dart';

import 'package:weight_mate/base/utils/ui_helper.dart';
import 'widgets/bottom_bar.dart';
import 'widgets/bill_body.dart';

class CreateBillView extends StackedView<CreateBillViewModel> {
  const CreateBillView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, CreateBillViewModel _, Widget? child) {
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
      body: const BillBody(),
      bottomSheet: const BottomBar(),
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
