import 'package:flutter/material.dart';
import 'package:weight_mate/ui/common/app_colors.dart';

class WalkthroughDots extends StatelessWidget {
  final int totalSlides;
  final int currentIndex;

  const WalkthroughDots({
    super.key,
    required this.totalSlides,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalSlides, (i) {
        final active = i == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: active ? 20 : 6,
          height: 6,
          margin: const EdgeInsets.only(right: 7),
          decoration: BoxDecoration(
            color: active ? kcPrimaryColor : kcLightDisabled,
            borderRadius: BorderRadius.circular(9),
          ),
        );
      }),
    );
  }
}
