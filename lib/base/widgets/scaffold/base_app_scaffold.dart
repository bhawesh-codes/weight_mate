import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weight_mate/base/utils/app_theme.dart';
import 'package:weight_mate/base/utils/ui_helper.dart';

class BaseAppScaffold extends StatelessWidget {
  /// Child widget, that contain the content of the screen
  final Widget body;

  /// AppBar widget, that contain the custom appbar of the screen
  final PreferredSizeWidget? appBar;

  /// BottomNavigationBar widget, that contain the custom bottom navigation bar of the screen
  final Widget? bottomNavigationBar;

  // Add horizontal padding to the body
  final bool addHorizontalPadding;

  // Drawer widget, that contain the custom drawer of the screen
  final Widget? drawer;

  // EndDrawer widget, that contain the custom end drawer of the screen
  final Widget? endDrawer;

  // Add scaffold backGroundColor
  final Color? scaffoldBackgroundColor;

  // Add extendBodyBehindAppBar
  final bool extendBodyBehindAppBar;

  // Add extendBody
  final bool extendBody;

  /// Floating action button
  final Widget? floatingActionButton;

  /// Bottom Sheet
  final Widget? bottomSheet;
  final Color? statusBarColor;
  final Brightness? statusBarIconBrightness;

  /// Resize to avoid bottom inset
  final bool? resizeToAvoidBottomInset;
  const BaseAppScaffold(
      {super.key,
      required this.body,
      this.appBar,
      this.drawer,
      this.endDrawer,
      this.bottomNavigationBar,
      this.floatingActionButton,
      this.scaffoldBackgroundColor = Colors.white,
      this.addHorizontalPadding = true,
      this.extendBodyBehindAppBar = false,
      this.extendBody = false,
      this.bottomSheet,
      this.resizeToAvoidBottomInset,
      this.statusBarColor,
      this.statusBarIconBrightness});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          bottomSheet: bottomSheet,
          extendBody: extendBody,
          extendBodyBehindAppBar: extendBodyBehindAppBar,
          appBar: appBar ??
              AppBar(
                toolbarHeight: 0,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor:
                      statusBarColor ?? AppTheme.primaryColor(context),
                  statusBarIconBrightness: statusBarIconBrightness ??
                      Brightness.dark, // For Android (dark icons)
                  statusBarBrightness: Brightness.light, // For iOS (dark icons)
                ),
              ),
          backgroundColor:
              scaffoldBackgroundColor ?? AppTheme.primaryColor(context),
          body: Padding(
            padding: addHorizontalPadding
                ? UIHelper.paddingHorizontal(spacing: Spacing.medium)
                : EdgeInsets.zero,
            child: body,
          ),
          drawer: drawer,
          endDrawer: endDrawer,
          floatingActionButton: floatingActionButton ?? const SizedBox.shrink(),
          bottomNavigationBar: bottomNavigationBar,
        ),
      ),
    );
  }
}
