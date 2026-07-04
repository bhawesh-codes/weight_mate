import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/base/widgets/text/title_text.dart';
import 'package:weight_mate/ui/common/app_colors.dart';

class WalkthroughSliderItem extends StatelessWidget {
  final String title;
  final String title2;
  final String image;
  final String subtitle;
  const WalkthroughSliderItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.title2,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            image,
            height: 144.h,
            width: 144.w,
          ),
          UIHelper.verticalSpaceMedium,
          TitleTextWidget(
            text: title,
            textType: TextType.large,
            color: kcLightPrimaryText,
          ),
          TitleTextWidget(
            text: title2,
            textType: TextType.large,
            color: kcLightPrimaryText,
          ),
          UIHelper.verticalSpaceSmall,
          SizedBox(
            child: BodyTextWidget(
              text: subtitle,
              textAlign: TextAlign.center,
              color: kcLightSecondaryText,
              textType: TextType.smedium,
            ),
          ),
        ],
      ),
    );
  }
}
