import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/base/widgets/scaffold/base_app_scaffold.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'package:weight_mate/ui/common/ui_helpers.dart' as UIHelper;
import 'package:weight_mate/ui/views/walkthrough/widgets/walkthrough_carousel.dart';
import 'walkthrough_viewmodel.dart';
import 'widgets/dots_wrapper.dart';
import 'widgets/get_started_button.dart';
import 'widgets/next_button.dart';

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
                  const WalkthroughDotsWrapper(),
                  const WalkthroughNextButton(),
                ],
              ),

            // ── Dots + Get Started button (last slide) ─
            if (viewModel.currentIndex == 2) ...[
              const WalkthroughDotsWrapper(),
              UIHelper.verticalSpaceMedium,
              const WalkthroughGetStartedButton(),
            ],
          ],
        ),
      ),
    );
  }
}


