import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:weight_mate/base/utils/text_type.dart';
import 'package:weight_mate/base/widgets/scaffold/base_app_scaffold.dart';
import 'package:weight_mate/base/widgets/text/body_text.dart';
import 'package:weight_mate/base/widgets/text/title_text.dart';
import 'package:weight_mate/ui/common/app_colors.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';
import 'settings_viewmodel.dart';

class SettingsView extends StackedView<SettingsViewModel> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, SettingsViewModel viewModel, Widget? child) {
    return BaseAppScaffold(
      statusBarColor: kcBackgroundColor,
      statusBarIconBrightness: Brightness.dark,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _TopBar(onBack: viewModel.onBack),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _ProfileSection(
                      storeName: viewModel.storeName,
                      storeAddress: viewModel.storeAddress,
                      storePhone: viewModel.storePhone,
                      onEditTap: viewModel.openShopProfile,
                    ),
                    UIHelper.verticalSpace(24.h),
                    const _SectionHeader(title: 'Account & Shop'),
                    UIHelper.verticalSpace(8.h),
                    _SettingsCard(children: [
                      _SettingsItem(
                        icon: Icons.person_outline,
                        title: 'Shop Profile',
                        onTap: viewModel.openShopProfile,
                      ),
                      const _SettingsDivider(),
                      _SettingsItem(
                        icon: Icons.qr_code_2_outlined,
                        title: 'QR Payment Setup',
                        onTap: viewModel.openQrPaymentSetup,
                      ),
                    ]),
                    UIHelper.verticalSpace(24.h),
                    const _SectionHeader(title: 'Preferences'),
                    UIHelper.verticalSpace(8.h),
                    _SettingsCard(children: [
                      _SettingsItem(
                        icon: Icons.payments_outlined,
                        title: 'Currency',
                        subtitle: '(₹) Nepal Rupee',
                        onTap: viewModel.openCurrency,
                      ),
                      const _SettingsDivider(),
                      _SettingsItem(
                        icon: Icons.language_outlined,
                        title: 'Language',
                        subtitle: 'English',
                        onTap: viewModel.openLanguage,
                      ),
                      const _SettingsDivider(),
                      _SettingsItem(
                        icon: Icons.dark_mode_outlined,
                        title: 'Theme',
                        subtitle: 'System',
                        onTap: viewModel.openTheme,
                      ),
                    ]),
                    UIHelper.verticalSpace(24.h),
                    const _SectionHeader(title: 'Data & About'),
                    UIHelper.verticalSpace(8.h),
                    _SettingsCard(children: [
                      _SettingsItem(
                        icon: Icons.cloud_upload_outlined,
                        title: 'Backup & Restore',
                        onTap: viewModel.openBackupRestore,
                      ),
                      const _SettingsDivider(),
                      _SettingsItem(
                        icon: Icons.info_outline,
                        title: 'About App',
                        onTap: viewModel.openAboutApp,
                      ),
                      const _SettingsDivider(),
                      _SettingsItem(
                        icon: Icons.lock_outline,
                        title: 'Privacy Policy',
                        onTap: viewModel.openPrivacyPolicy,
                      ),
                    ]),
                    UIHelper.verticalSpace(48.h),
                    _VersionInfo(version: viewModel.appVersion),
                    UIHelper.verticalSpace(24.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  SettingsViewModel viewModelBuilder(BuildContext context) => SettingsViewModel();
}

class _TopBar extends StatelessWidget {
  final VoidCallback onBack;
  const _TopBar({required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: onBack,
            child: Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: kcPrimaryContainer,
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Icon(Icons.arrow_back, color: kcPrimaryColor, size: 24.r),
            ),
          ),
          SizedBox(width: 12.w),
          const TitleTextWidget(
            text: 'Settings',
            color: kcPrimaryColor,
            textType: TextType.medium,
            fontWeight: FontWeight.bold,
          ),
          const Spacer(),
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: kcLightSurfaceVariant,
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: kcLightBorder),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Image.network(
                'https://lh3.googleusercontent.com/aida-public/AB6AXuD2U_dyh2QgqGYjuGWCpqVPVP0G1dmBAt0D0df0DKznEV3vD-5mJ-PcN1mdGQHZB_ayjlLZlwwO1iITkklTdlH9jmCAU74XzDaan3DKneIRMZwWs5JdTTFZxRkjk2ycCY9OuXnnW45CKmjwDIGvSBy6Ns2ENtFRqMV4aXY6E7Qwi4ldLf6sATQk4WnIYshSqyijDGGEi5OpjehonYG3hrDq6q0QThgqtWl-6smtDuIBp-1lmImQTP9f',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Icon(Icons.person, color: kcPrimaryColor, size: 20.r),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileSection extends StatelessWidget {
  final String storeName;
  final String storeAddress;
  final String storePhone;
  final VoidCallback onEditTap;
  const _ProfileSection({
    required this.storeName,
    required this.storeAddress,
    required this.storePhone,
    required this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: kcLightBorder.withValues(alpha: 0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 64.w,
            height: 64.h,
            decoration: BoxDecoration(
              color: kcPrimaryContainer,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Icon(Icons.storefront, color: kcPrimaryColor, size: 32.r),
          ),
          UIHelper.horizontalSpaceMedium,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleTextWidget(
                  text: storeName,
                  color: kcLightPrimaryText,
                  textType: TextType.smedium,
                  fontWeight: FontWeight.w600,
                ),
                UIHelper.verticalSpaceXXSmall,
                BodyTextWidget(
                  text: storeAddress,
                  color: kcLightSecondaryText,
                  textType: TextType.small,
                ),
                UIHelper.verticalSpaceXXSmall,
                BodyTextWidget(
                  text: storePhone,
                  color: kcLightSecondaryText,
                  textType: TextType.small,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onEditTap,
            child: Icon(Icons.edit_outlined, color: kcLightSecondaryText, size: 20.r),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.w),
      child: BodyTextWidget(
        text: title,
        color: kcPrimaryColor,
        textType: TextType.xsmall,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _SettingsCard extends StatelessWidget {
  final List<Widget> children;
  const _SettingsCard({required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: kcLightBorder.withValues(alpha: 0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }
}

class _SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;

  const _SettingsItem({
    required this.icon,
    required this.title,
    this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.r),
          bottom: Radius.circular(16.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Row(
            children: [
              Icon(icon, color: kcLightSecondaryText, size: 24.r),
              UIHelper.horizontalSpaceMedium,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BodyTextWidget(
                      text: title,
                      color: kcLightPrimaryText,
                      textType: TextType.medium,
                      fontWeight: FontWeight.w400,
                    ),
                    if (subtitle != null) ...[
                      UIHelper.verticalSpaceXXSmall,
                      BodyTextWidget(
                        text: subtitle!,
                        color: kcLightSecondaryText,
                        textType: TextType.small,
                      ),
                    ],
                  ],
                ),
              ),
              Icon(Icons.chevron_right, color: kcLightSecondaryText.withValues(alpha: 0.5), size: 20.r),
            ],
          ),
        ),
      ),
    );
  }
}

class _SettingsDivider extends StatelessWidget {
  const _SettingsDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      height: 1,
      color: kcLightBorder.withValues(alpha: 0.2),
    );
  }
}

class _VersionInfo extends StatelessWidget {
  final String version;
  const _VersionInfo({required this.version});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BodyTextWidget(
          text: 'WeightMate $version',
          color: kcLightSecondaryText,
          textType: TextType.small,
          fontWeight: FontWeight.w400,
        ),
        UIHelper.verticalSpaceXXSmall,
        const BodyTextWidget(
          text: 'Made for modern commerce',
          color: kcLightSecondaryText,
          textType: TextType.small,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }
}
