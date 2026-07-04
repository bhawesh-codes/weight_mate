import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:weight_mate/ui/views/walkthrough/widgets/walkthrough_slider_item.dart';

class WalkthroughCarousel extends StatelessWidget {
  final CarouselSliderController carouselController;
  final void Function(int index) onPageChanged;

  const WalkthroughCarousel({
    super.key,
    required this.carouselController,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: carouselController,
      items: const [
        WalkthroughSliderItem(
          title: 'Easy Weight',
          subtitle: 'Calculate price by weight in seconds with accuracy.',
          title2: 'Price Calculation',
          image: 'assets/images/walkthrough1.svg',
        ),
        WalkthroughSliderItem(
          title: 'Generate Bills',
          subtitle: 'Create professional bills and share with your customers.',
          title2: '& Share',
          image: 'assets/images/walkthrough2.svg',
        ),
        WalkthroughSliderItem(
          title: 'Accept Payments',
          subtitle: 'Show QR code and receive payments easily.',
          title2: 'with QR',
          image: 'assets/images/walkthrough3.svg',
        ),
      ],
      options: CarouselOptions(
        height: 400.h,
        enlargeCenterPage: false,
        autoPlay: false,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: false,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 1.0,
        onPageChanged: (index, _) => onPageChanged(index),
      ),
    );
  }
}
