import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/widgets/scaffold/base_app_scaffold.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'package:weight_mate/ui/common/ui_helpers.dart' as UIHelper;
import 'package:weight_mate/ui/views/walkthrough/widgets/walkthrough_carousel.dart';
import 'package:weight_mate/ui/views/walkthrough/widgets/walkthrough_dots.dart';
import 'walkthrough_viewmodel.dart';

class WalkthroughView extends StackedView<WalkthroughViewModel> {
  const WalkthroughView({super.key});

  @override
  WalkthroughViewModel viewModelBuilder(BuildContext context) =>
      WalkthroughViewModel();

  @override
  Widget builder(
    BuildContext context,
    WalkthroughViewModel viewModel,
    Widget? child,
  ) {
    return BaseAppScaffold(
      statusBarColor: kcBackgroundColor,
      addHorizontalPadding: false,
      body: Padding(
        padding: EdgeInsets.all(24.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UIHelper.verticalSpaceMassive,
            // ── Carousel ──────────────────────────────
            WalkthroughCarousel(
              carouselController: viewModel.carouselController,
              onPageChanged: viewModel.onPageChanged,
            ),
            const Spacer(),

            // ── Dots + Next button (slides 0-1) ────────
            if (viewModel.currentIndex < 2)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WalkthroughDots(
                    totalSlides: viewModel.totalSlides,
                    currentIndex: viewModel.currentIndex,
                  ),
                  SizedBox(
                    height: 36.h,
                    width: 100.w,
                    child: ElevatedButton(
                      onPressed: viewModel.onButtonTap,
                      child: const BodyTextWidget(
                        text: 'Next',
                        textType: TextType.smedium,
                        color: kcDarkPrimaryText,
                      ),
                    ),
                  ),
                ],
              ),

            // ── Dots + Get Started button (last slide) ─
            if (viewModel.currentIndex == 2) ...[
              WalkthroughDots(
                totalSlides: viewModel.totalSlides,
                currentIndex: viewModel.currentIndex,
              ),
              UIHelper.verticalSpaceMedium,
              SizedBox(
                height: 44.h,
                child: ElevatedButton(
                  onPressed: viewModel.onButtonTap,
                  child: const BodyTextWidget(
                    textType: TextType.medium,
                    text: 'Get Started',
                    color: kcDarkPrimaryText,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
