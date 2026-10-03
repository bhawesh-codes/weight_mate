import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/models/currency.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import '../settings_viewmodel.dart';
import 'section_header.dart';
import 'settings_card.dart';
import 'settings_item.dart';
import 'settings_divider.dart';

class SettingsSections extends ViewModelWidget<SettingsViewModel> {
  const SettingsSections();

  void _showCurrencyPicker(BuildContext context, SettingsViewModel viewModel) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (ctx) {
        return Padding(
          padding: EdgeInsets.only(top: 16.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: kcLightBorder,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              UIHelper.verticalSpace(16.h),
              const BodyTextWidget(
                text: 'Select Currency',
                textType: TextType.large,
                fontWeight: FontWeight.w600,
                color: kcLightPrimaryText,
              ),
              UIHelper.verticalSpace(8.h),
              Flexible(
                child: ListView.builder(
                  itemCount: Currency.supported.length,
                  padding: EdgeInsets.only(bottom: 16.h),
                  itemBuilder: (context, index) {
                    final currency = Currency.supported[index];
                    final isSelected = viewModel.currencyCode == currency.code;
                    return ListTile(
                      leading: Text(
                        currency.symbol,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      title: BodyTextWidget(
                        text: currency.name,
                        textType: TextType.medium,
                        color: kcLightPrimaryText,
                      ),
                      subtitle: BodyTextWidget(
                        text: currency.code,
                        textType: TextType.xsmall,
                        color: kcLightSecondaryText,
                      ),
                      trailing: isSelected
                          ? Icon(Icons.check_circle, color: kcPrimaryColor, size: 24.r)
                          : null,
                      onTap: () {
                        viewModel.setCurrency(currency.code);
                        Navigator.pop(ctx);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, SettingsViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: 'Account & Shop'),
        UIHelper.verticalSpace(8.h),
        SettingsCard(children: [
          SettingsItem(
            icon: Icons.person_outline,
            title: 'Shop Profile',
            onTap: viewModel.openShopProfile,
          ),
          const SettingsDivider(),
          SettingsItem(
            icon: Icons.qr_code_2_outlined,
            title: 'QR Payment Setup',
            onTap: viewModel.openQrPaymentSetup,
          ),
        ]),
        UIHelper.verticalSpace(24.h),
        SectionHeader(title: 'Preferences'),
        UIHelper.verticalSpace(8.h),
        SettingsCard(children: [
          SettingsItem(
            icon: Icons.payments_outlined,
            title: 'Currency',
            subtitle: '(${viewModel.currencySymbol}) ${viewModel.currencyName}',
            onTap: () => _showCurrencyPicker(context, viewModel),
          ),
          const SettingsDivider(),
          SettingsItem(
            icon: Icons.language_outlined,
            title: 'Language',
            subtitle: 'English',
            onTap: viewModel.openLanguage,
          ),
          const SettingsDivider(),
          SettingsItem(
            icon: Icons.dark_mode_outlined,
            title: 'Theme',
            subtitle: 'System',
            onTap: viewModel.openTheme,
          ),
        ]),
        UIHelper.verticalSpace(24.h),
        SectionHeader(title: 'Data & About'),
        UIHelper.verticalSpace(8.h),
        SettingsCard(children: [
          SettingsItem(
            icon: Icons.cloud_upload_outlined,
            title: 'Backup & Restore',
            onTap: viewModel.openBackupRestore,
          ),
          const SettingsDivider(),
          SettingsItem(
            icon: Icons.info_outline,
            title: 'About App',
            onTap: viewModel.openAboutApp,
          ),
          const SettingsDivider(),
          SettingsItem(
            icon: Icons.lock_outline,
            title: 'Privacy Policy',
            onTap: viewModel.openPrivacyPolicy,
          ),
        ]),
      ],
    );
  }
}
