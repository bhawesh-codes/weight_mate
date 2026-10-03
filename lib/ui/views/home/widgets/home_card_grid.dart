import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'home_card.dart';

class HomeCardGrid extends StatelessWidget {
  final VoidCallback onQuickCalculator;
  final VoidCallback onCreateBills;
  final VoidCallback onProducts;
  final VoidCallback onBillHistory;
  final VoidCallback onUploadQr;
  final VoidCallback onSettings;

  const HomeCardGrid({
    super.key,
    required this.onQuickCalculator,
    required this.onCreateBills,
    required this.onProducts,
    required this.onBillHistory,
    required this.onUploadQr,
    required this.onSettings,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12.h,
      crossAxisSpacing: 12.w,
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 1.1,
      children: [
        HomeCard(
          icon: Icons.calculate_outlined,
          title: 'Quick Calculator',
          subtitle: 'Calculate prices instantly',
          bgColor: kcPrimaryColor,
          iconColor: kcLightCard,
          titleColor: kcDarkPrimaryText,
          onTap: onQuickCalculator,
        ),
        HomeCard(
          icon: Icons.receipt_long,
          title: 'Create Bill',
          subtitle: 'Generate new invoices',
          bgColor: kcAccentColor,
          iconColor: kcLightCard,
          titleColor: kcDarkPrimaryText,
          onTap: onCreateBills,
        ),
        HomeCard(
          icon: Icons.inventory_2_outlined,
          title: 'Products',
          subtitle: 'Manage saved items',
          bgColor: kcLightCard,
          iconColor: kcPrimaryColor,
          titleColor: kcLightPrimaryText,
          onTap: onProducts,
        ),
        HomeCard(
          icon: Icons.history,
          title: 'Bill History',
          subtitle: 'View past transactions',
          bgColor: kcLightCard,
          iconColor: kcPrimaryColor,
          titleColor: kcLightPrimaryText,
          onTap: onBillHistory,
        ),
        HomeCard(
          icon: Icons.qr_code_2_outlined,
          title: 'Upload QR',
          subtitle: 'Set up payment QR',
          bgColor: kcLightCard,
          iconColor: kcPrimaryColor,
          titleColor: kcLightPrimaryText,
          onTap: onUploadQr,
        ),
        HomeCard(
          icon: Icons.settings,
          title: 'Settings',
          subtitle: 'Store & app preferences',
          bgColor: kcLightCard,
          iconColor: kcPrimaryColor,
          titleColor: kcLightPrimaryText,
          onTap: onSettings,
        ),
      ],
    );
  }
}
