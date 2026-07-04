import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:weight_mate/base/utils/app_theme.dart';
import 'package:weight_mate/base/utils/text_type.dart';

/// Title text widget
///
/// DO NOT MODIFY
/// @param [text] is mandatory
///
/// @param [color] [fontWeight] [textType] [textAlign] are optional
///
/// @param [color] is optional, default value is Colors.black
/// @param [textType] options are large, medium and small
/// default value is medium
/// @param [fontWeight] is optional, default value is FontWeight.bold
///
class TitleTextWidget extends StatelessWidget {
  /// [text] is button label, value is mandatory
  final String text;

  /// Background color of button
  final Color? color;

  /// Fontweight for button label i.e. [text]
  final FontWeight fontWeight;

  /// Sizes for label [text]
  final TextType textType;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  /// The directionality of the text.
  final TextDirection textDirection;

  /// TextDecoration of the text.
  final TextDecoration textDecoration;

  final Color? decorationColor;

  /// Maximum lines
  final int? maxLines;

  /// Add text overflow behaviour
  final TextOverflow? overflow;

  /// Creates a text widget with variable sizes
  ///
  /// [text] parameter must not be null
  const TitleTextWidget({
    super.key,
    required this.text,
    this.color,
    this.fontWeight = FontWeight.bold,
    this.textType = TextType.medium,
    this.textDirection = TextDirection.ltr,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.textDecoration = TextDecoration.none,
    this.decorationColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      textDirection: textDirection,
      style: AppTheme.bodyMediumTextStyle(context)?.copyWith(
          color: color,
          fontWeight: fontWeight,
          fontSize: _getFontSizeByTextType(),
          overflow: overflow,
          decorationColor: decorationColor,
          decorationThickness: _getDecorationThicknessTextType(),
          decoration: textDecoration),
      maxLines: maxLines,
    );
  }

  double _getFontSizeByTextType() {
    if (textType == TextType.xlarge) {
      return 24.sp;
    } else if (textType == TextType.large) {
      return 20.sp;
    } else if (textType == TextType.xxlarge) {
      return 32.sp;
    } else if (textType == TextType.medium) {
      return 16.sp;
    } else if (textType == TextType.smedium) {
      return 14.sp;
    } else if (textType == TextType.small) {
      return 12.sp;
    } else if (textType == TextType.xsmall) {
      return 10.sp;
    }

    // for xxsmall
    return 8.sp;
  }

  double _getDecorationThicknessTextType() {
    if (textType == TextType.xlarge) {
      return 8.sp;
    } else if (textType == TextType.large) {
      return 6.sp;
    } else if (textType == TextType.medium) {
      return 5.sp;
    } else if (textType == TextType.smedium) {
      return 4.sp;
    } else if (textType == TextType.small) {
      return 2.sp;
    } else if (textType == TextType.xsmall) {
      return 1.sp;
    }

    // for xxsmall
    return 8.sp;
  }
}
