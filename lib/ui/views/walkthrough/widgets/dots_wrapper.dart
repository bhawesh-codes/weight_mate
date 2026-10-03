import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/ui/views/walkthrough/walkthrough_viewmodel.dart';
import 'package:weight_mate/ui/views/walkthrough/widgets/walkthrough_dots.dart';

class WalkthroughDotsWrapper extends ViewModelWidget<WalkthroughViewModel> {
  const WalkthroughDotsWrapper();

  @override
  Widget build(BuildContext context, WalkthroughViewModel viewModel) {
    return WalkthroughDots(
      totalSlides: viewModel.totalSlides,
      currentIndex: viewModel.currentIndex,
    );
  }
}
