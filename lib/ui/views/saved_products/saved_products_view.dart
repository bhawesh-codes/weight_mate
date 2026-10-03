import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/widgets/text/title_text.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'saved_products_viewmodel.dart';
import 'widgets/body.dart';

class SavedProductsView extends StackedView<SavedProductsViewModel> {
  const SavedProductsView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, SavedProductsViewModel viewModel, Widget? child) {
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
          text: 'Saved Products',
          textType: TextType.medium,
          fontWeight: FontWeight.w700,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: CircleAvatar(
              radius: 16.r,
              backgroundColor: kcPrimaryContainer,
              child: Icon(Icons.person, size: 18.r, color: kcPrimaryColor),
            ),
          ),
        ],
      ),
      body: viewModel.isBusy
          ? const Center(child: CircularProgressIndicator())
          : const Body(),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.openAddProduct,
        backgroundColor: kcPrimaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Icon(Icons.add, size: 28.r),
      ),
    );
  }

  @override
  SavedProductsViewModel viewModelBuilder(BuildContext context) =>
      SavedProductsViewModel();

  @override
  void onViewModelReady(SavedProductsViewModel viewModel) {
    viewModel.init();
  }
}


