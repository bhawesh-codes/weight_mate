import 'package:flutter/material.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/ui/common/app_colors.dart';

class SectionLabel extends StatelessWidget {
  final String text;
  const SectionLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return BodyTextWidget(
      text: text,
      color: kcLightPrimaryText,
      textType: TextType.smedium,
      fontWeight: FontWeight.w600,
    );
  }
}
