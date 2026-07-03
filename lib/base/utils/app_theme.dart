import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weight_mate/ui/common/app_colors.dart';

/// Design tokens for spacing (8-point grid), radius, and elevation, per the
/// WeightMate Theme Design PRD. Kept as plain `double`s (not run through
/// ScreenUtil) so the grid stays exact across devices.
class AppRadius {
  AppRadius._();
  static const double button = 16;
  static const double textField = 16;
  static const double card = 20;
  static const double fab = 20;
  static const double dialog = 24;
  static const double bottomSheet = 28;
  static const double chip = 12;
}

class AppSpacing {
  AppSpacing._();
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 20;
  static const double xxl = 24;
  static const double xxxl = 32;
  static const double huge = 40;
  static const double massive = 48;
  static const double giant = 64;
  static const double colossal = 80;
  static const double max = 96;
}

class AppElevation {
  AppElevation._();
  static const double card = 1;
  static const double button = 0;
  static const double fab = 3;
  static const double dialog = 6;
  static const double bottomSheet = 2;
  static const double navigationBar = 0;
}

class AppDurations {
  AppDurations._();
  static const Duration standard = Duration(milliseconds: 200);
  static const Curve curve = Curves.easeOutCubic;
}

/// Semantic colors that don't have a home in Flutter's built-in
/// [ColorScheme] (success / warning / info, plus card/border/hint/disabled
/// tokens). Exposed as a [ThemeExtension] so they flip automatically with
/// light/dark mode and stay accessible via `Theme.of(context)`.
@immutable
class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  const AppColorsExtension({
    required this.card,
    required this.surfaceVariant,
    required this.hintText,
    required this.disabled,
    required this.border,
    required this.divider,
    required this.success,
    required this.warning,
    required this.error,
    required this.info,
    required this.accent,
    required this.primaryContainer,
  });

  final Color card;
  final Color surfaceVariant;
  final Color hintText;
  final Color disabled;
  final Color border;
  final Color divider;
  final Color success;
  final Color warning;
  final Color error;
  final Color info;
  final Color accent;
  final Color primaryContainer;

  static const AppColorsExtension light = AppColorsExtension(
    card: kcLightCard,
    surfaceVariant: kcLightSurfaceVariant,
    hintText: kcLightHintText,
    disabled: kcLightDisabled,
    border: kcLightBorder,
    divider: kcLightDivider,
    success: kcSuccessColor,
    warning: kcWarningColor,
    error: kcErrorColor,
    info: kcInfoColor,
    accent: kcAccentColor,
    primaryContainer: kcPrimaryContainer,
  );

  static const AppColorsExtension dark = AppColorsExtension(
    card: kcDarkCard,
    surfaceVariant: kcDarkSurfaceVariant,
    hintText: kcDarkHintText,
    disabled: kcDarkDisabled,
    border: kcDarkBorder,
    divider: kcDarkDivider,
    success: kcDarkSuccess,
    warning: kcDarkWarning,
    error: kcDarkError,
    info: kcDarkInfo,
    accent: kcDarkAccent,
    primaryContainer: kcDarkPrimaryContainer,
  );

  @override
  AppColorsExtension copyWith({
    Color? card,
    Color? surfaceVariant,
    Color? hintText,
    Color? disabled,
    Color? border,
    Color? divider,
    Color? success,
    Color? warning,
    Color? error,
    Color? info,
    Color? accent,
    Color? primaryContainer,
  }) {
    return AppColorsExtension(
      card: card ?? this.card,
      surfaceVariant: surfaceVariant ?? this.surfaceVariant,
      hintText: hintText ?? this.hintText,
      disabled: disabled ?? this.disabled,
      border: border ?? this.border,
      divider: divider ?? this.divider,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      error: error ?? this.error,
      info: info ?? this.info,
      accent: accent ?? this.accent,
      primaryContainer: primaryContainer ?? this.primaryContainer,
    );
  }

  @override
  AppColorsExtension lerp(ThemeExtension<AppColorsExtension>? other, double t) {
    if (other is! AppColorsExtension) return this;
    return AppColorsExtension(
      card: Color.lerp(card, other.card, t)!,
      surfaceVariant: Color.lerp(surfaceVariant, other.surfaceVariant, t)!,
      hintText: Color.lerp(hintText, other.hintText, t)!,
      disabled: Color.lerp(disabled, other.disabled, t)!,
      border: Color.lerp(border, other.border, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      error: Color.lerp(error, other.error, t)!,
      info: Color.lerp(info, other.info, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      primaryContainer:
          Color.lerp(primaryContainer, other.primaryContainer, t)!,
    );
  }
}

class AppTheme {
  AppTheme._();

  // ---------------------------------------------------------------------
  // Public theme data
  // ---------------------------------------------------------------------

  static final ThemeData appThemeLight = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: _lightColorScheme,
    scaffoldBackgroundColor: kcLightBackground,
    canvasColor: kcLightBackground,
    fontFamily: GoogleFonts.inter().fontFamily,
    textTheme: _textTheme(
      primary: kcLightPrimaryText,
      secondary: kcLightSecondaryText,
    ),
    appBarTheme: _appBarTheme(
      foreground: kcLightPrimaryText,
      background: kcLightBackground,
      overlay: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: kcLightBackground,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    ),
    cardTheme: _cardTheme(background: kcLightCard, border: kcLightBorder),
    dividerTheme: const DividerThemeData(color: kcLightDivider, thickness: 1),
    iconTheme: const IconThemeData(color: kcPrimaryColor, size: 24),
    iconButtonTheme: _iconButtonTheme(color: kcPrimaryColor),
    elevatedButtonTheme: _elevatedButtonTheme(
      background: kcPrimaryColor,
      foreground: Colors.white,
    ),
    filledButtonTheme: _filledButtonTheme(
      background: kcPrimaryColor,
      foreground: Colors.white,
    ),
    outlinedButtonTheme: _outlinedButtonTheme(color: kcPrimaryColor),
    textButtonTheme: _textButtonTheme(color: kcPrimaryColor),
    inputDecorationTheme: _inputDecorationTheme(
      fill: kcLightSurfaceVariant,
      hint: kcLightHintText,
      border: kcLightBorder,
      focused: kcPrimaryColor,
      error: kcErrorColor,
    ),
    floatingActionButtonTheme: _fabTheme(
      background: kcPrimaryColor,
      foreground: Colors.white,
    ),
    navigationBarTheme: _navigationBarTheme(
      background: kcLightSurface,
      selected: kcPrimaryColor,
      unselected: kcLightSecondaryText,
    ),
    chipTheme: _chipTheme(
      background: kcLightSurfaceVariant,
      selected: kcPrimaryContainer,
      label: kcLightPrimaryText,
    ),
    dialogTheme: _dialogTheme(background: kcLightSurface),
    bottomSheetTheme: _bottomSheetTheme(background: kcLightSurface),
    snackBarTheme:
        _snackBarTheme(background: kcDarkGreyColor, foreground: Colors.white),
    dividerColor: kcLightDivider,
    highlightColor: kcPrimaryColorLight.withOpacity(0.08),
    splashColor: kcPrimaryColorLight.withOpacity(0.12),
    extensions: const [AppColorsExtension.light],
  );

  static final ThemeData appThemeDark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: _darkColorScheme,
    scaffoldBackgroundColor: kcDarkBackground,
    canvasColor: kcDarkBackground,
    fontFamily: GoogleFonts.inter().fontFamily,
    textTheme: _textTheme(
      primary: kcDarkPrimaryText,
      secondary: kcDarkSecondaryText,
    ),
    appBarTheme: _appBarTheme(
      foreground: kcDarkPrimaryText,
      background: kcDarkBackground,
      overlay: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: kcDarkBackground,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    ),
    cardTheme: _cardTheme(background: kcDarkCard, border: kcDarkBorder),
    dividerTheme: const DividerThemeData(color: kcDarkDivider, thickness: 1),
    iconTheme: const IconThemeData(color: kcDarkPrimary, size: 24),
    iconButtonTheme: _iconButtonTheme(color: kcDarkPrimary),
    elevatedButtonTheme: _elevatedButtonTheme(
      background: kcDarkPrimary,
      foreground: kcDarkBackground,
    ),
    filledButtonTheme: _filledButtonTheme(
      background: kcDarkPrimary,
      foreground: kcDarkBackground,
    ),
    outlinedButtonTheme: _outlinedButtonTheme(color: kcDarkPrimary),
    textButtonTheme: _textButtonTheme(color: kcDarkPrimary),
    inputDecorationTheme: _inputDecorationTheme(
      fill: kcDarkSurfaceVariant,
      hint: kcDarkHintText,
      border: kcDarkBorder,
      focused: kcDarkPrimary,
      error: kcDarkError,
    ),
    floatingActionButtonTheme: _fabTheme(
      background: kcDarkPrimary,
      foreground: kcDarkBackground,
    ),
    navigationBarTheme: _navigationBarTheme(
      background: kcDarkSurface,
      selected: kcDarkPrimary,
      unselected: kcDarkSecondaryText,
    ),
    chipTheme: _chipTheme(
      background: kcDarkSurfaceVariant,
      selected: kcDarkPrimaryContainer,
      label: kcDarkPrimaryText,
    ),
    dialogTheme: _dialogTheme(background: kcDarkSurface),
    bottomSheetTheme: _bottomSheetTheme(background: kcDarkSurface),
    snackBarTheme: _snackBarTheme(
        background: kcDarkSurfaceVariant, foreground: kcDarkPrimaryText),
    dividerColor: kcDarkDivider,
    highlightColor: kcDarkPrimary.withOpacity(0.08),
    splashColor: kcDarkPrimary.withOpacity(0.12),
    extensions: const [AppColorsExtension.dark],
  );

  // ---------------------------------------------------------------------
  // Color schemes
  // ---------------------------------------------------------------------

  static const ColorScheme _lightColorScheme = ColorScheme.light(
    primary: kcPrimaryColor,
    onPrimary: Colors.white,
    primaryContainer: kcPrimaryContainer,
    onPrimaryContainer: kcPrimaryColor,
    secondary: kcSecondaryColor,
    onSecondary: Colors.white,
    surface: kcLightSurface,
    onSurface: kcLightPrimaryText,
    surfaceContainerHighest: kcLightSurfaceVariant,
    onSurfaceVariant: kcLightSecondaryText,
    outline: kcLightBorder,
    outlineVariant: kcLightDivider,
    error: kcErrorColor,
    onError: Colors.white,
    brightness: Brightness.light,
  );

  static const ColorScheme _darkColorScheme = ColorScheme.dark(
    primary: kcDarkPrimary,
    onPrimary: kcDarkBackground,
    primaryContainer: kcDarkPrimaryContainer,
    onPrimaryContainer: kcDarkPrimary,
    secondary: kcDarkSecondary,
    onSecondary: kcDarkBackground,
    surface: kcDarkSurface,
    onSurface: kcDarkPrimaryText,
    surfaceContainerHighest: kcDarkSurfaceVariant,
    onSurfaceVariant: kcDarkSecondaryText,
    outline: kcDarkBorder,
    outlineVariant: kcDarkDivider,
    error: kcDarkError,
    onError: kcDarkBackground,
    brightness: Brightness.dark,
  );

  // ---------------------------------------------------------------------
  // Component theme builders
  // ---------------------------------------------------------------------

  static TextTheme _textTheme(
      {required Color primary, required Color secondary}) {
    TextStyle base(double size, FontWeight weight, Color color) =>
        GoogleFonts.inter(fontSize: size.sp, fontWeight: weight, color: color);

    return TextTheme(
      displayLarge: base(32, FontWeight.w700, primary),
      displayMedium: base(28, FontWeight.w700, primary),
      headlineLarge: base(24, FontWeight.w600, primary),
      headlineMedium: base(22, FontWeight.w600, primary),
      titleLarge: base(20, FontWeight.w600, primary),
      titleMedium: base(18, FontWeight.w500, primary),
      titleSmall: base(16, FontWeight.w500, primary),
      bodyLarge: base(16, FontWeight.w400, primary),
      bodyMedium: base(15, FontWeight.w400, primary),
      bodySmall: base(14, FontWeight.w400, secondary),
      labelLarge: base(16, FontWeight.w600, primary),
      labelMedium: base(14, FontWeight.w500, secondary),
      labelSmall: base(12, FontWeight.w500, secondary),
    );
  }

  static AppBarTheme _appBarTheme({
    required Color foreground,
    required Color background,
    required SystemUiOverlayStyle overlay,
  }) {
    return AppBarTheme(
      backgroundColor: background,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      systemOverlayStyle: overlay,
      iconTheme: IconThemeData(color: foreground),
      titleTextStyle: GoogleFonts.inter(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: foreground,
      ),
    );
  }

  static CardThemeData _cardTheme(
      {required Color background, required Color border}) {
    return CardThemeData(
      color: background,
      elevation: AppElevation.card,
      shadowColor: Colors.black.withOpacity(0.08),
      surfaceTintColor: Colors.transparent,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.card.r),
        side: BorderSide(color: border, width: 1),
      ),
    );
  }

  static IconButtonThemeData _iconButtonTheme({required Color color}) {
    return IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: color,
        minimumSize: const Size(48, 48),
        shape: const CircleBorder(),
      ),
    );
  }

  static ElevatedButtonThemeData _elevatedButtonTheme({
    required Color background,
    required Color foreground,
  }) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: background,
        foregroundColor: foreground,
        disabledBackgroundColor: background.withOpacity(0.4),
        minimumSize: const Size.fromHeight(56),
        elevation: AppElevation.button,
        textStyle:
            GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.button.r),
        ),
      ),
    );
  }

  static FilledButtonThemeData _filledButtonTheme({
    required Color background,
    required Color foreground,
  }) {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: background,
        foregroundColor: foreground,
        minimumSize: const Size.fromHeight(56),
        textStyle:
            GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.button.r),
        ),
      ),
    );
  }

  static OutlinedButtonThemeData _outlinedButtonTheme({required Color color}) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: color,
        minimumSize: const Size.fromHeight(56),
        side: BorderSide(color: color, width: 1),
        textStyle:
            GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.button.r),
        ),
      ),
    );
  }

  static TextButtonThemeData _textButtonTheme({required Color color}) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: color,
        textStyle:
            GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.button.r),
        ),
      ),
    );
  }

  static InputDecorationTheme _inputDecorationTheme({
    required Color fill,
    required Color hint,
    required Color border,
    required Color focused,
    required Color error,
  }) {
    OutlineInputBorder shape(Color c) => OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.textField.r),
          borderSide: BorderSide(color: c, width: 1),
        );

    return InputDecorationTheme(
      filled: true,
      fillColor: fill,
      contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg, vertical: AppSpacing.lg),
      hintStyle: GoogleFonts.inter(fontSize: 16.sp, color: hint),
      border: shape(Colors.transparent),
      enabledBorder: shape(Colors.transparent),
      focusedBorder: shape(focused),
      errorBorder: shape(error),
      focusedErrorBorder: shape(error),
    );
  }

  static FloatingActionButtonThemeData _fabTheme({
    required Color background,
    required Color foreground,
  }) {
    return FloatingActionButtonThemeData(
      backgroundColor: background,
      foregroundColor: foreground,
      elevation: AppElevation.fab,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.fab.r),
      ),
    );
  }

  static NavigationBarThemeData _navigationBarTheme({
    required Color background,
    required Color selected,
    required Color unselected,
  }) {
    return NavigationBarThemeData(
      backgroundColor: background,
      elevation: AppElevation.navigationBar,
      indicatorColor: selected.withOpacity(0.14),
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        final isSelected = states.contains(WidgetState.selected);
        return GoogleFonts.inter(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: isSelected ? selected : unselected,
        );
      }),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        final isSelected = states.contains(WidgetState.selected);
        return IconThemeData(color: isSelected ? selected : unselected);
      }),
    );
  }

  static ChipThemeData _chipTheme({
    required Color background,
    required Color selected,
    required Color label,
  }) {
    return ChipThemeData(
      backgroundColor: background,
      selectedColor: selected,
      labelStyle: GoogleFonts.inter(
          fontSize: 14.sp, fontWeight: FontWeight.w500, color: label),
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md, vertical: AppSpacing.xs),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.chip.r),
      ),
    );
  }

  static DialogThemeData _dialogTheme({required Color background}) {
    return DialogThemeData(
      backgroundColor: background,
      elevation: AppElevation.dialog,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.dialog.r),
      ),
    );
  }

  static BottomSheetThemeData _bottomSheetTheme({required Color background}) {
    return BottomSheetThemeData(
      backgroundColor: background,
      elevation: AppElevation.bottomSheet,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppRadius.bottomSheet.r)),
      ),
    );
  }

  static SnackBarThemeData _snackBarTheme(
      {required Color background, required Color foreground}) {
    return SnackBarThemeData(
      backgroundColor: background,
      contentTextStyle: GoogleFonts.inter(fontSize: 14.sp, color: foreground),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.button.r),
      ),
    );
  }

  // ---------------------------------------------------------------------
  // Convenience accessors (kept close to the original API surface)
  // ---------------------------------------------------------------------

  static Color primaryColor(BuildContext context) =>
      Theme.of(context).colorScheme.primary;

  static Color secondaryColor(BuildContext context) =>
      Theme.of(context).colorScheme.secondary;

  static Color onPrimaryColor(BuildContext context) =>
      Theme.of(context).colorScheme.onPrimary;

  static Color onSurfaceColor(BuildContext context) =>
      Theme.of(context).colorScheme.onSurface;

  static Color backgroundColor(BuildContext context) =>
      Theme.of(context).scaffoldBackgroundColor;

  static Color cardColor(BuildContext context) =>
      Theme.of(context).extension<AppColorsExtension>()!.card;

  static Color borderColor(BuildContext context) =>
      Theme.of(context).extension<AppColorsExtension>()!.border;

  static Color hintColor(BuildContext context) =>
      Theme.of(context).extension<AppColorsExtension>()!.hintText;

  static Color successColor(BuildContext context) =>
      Theme.of(context).extension<AppColorsExtension>()!.success;

  static Color warningColor(BuildContext context) =>
      Theme.of(context).extension<AppColorsExtension>()!.warning;

  static Color errorColor(BuildContext context) =>
      Theme.of(context).extension<AppColorsExtension>()!.error;

  static Color infoColor(BuildContext context) =>
      Theme.of(context).extension<AppColorsExtension>()!.info;

  static Color accentColor(BuildContext context) =>
      Theme.of(context).extension<AppColorsExtension>()!.accent;

  static ColorScheme colorScheme(BuildContext context) =>
      Theme.of(context).colorScheme;

  static TextTheme textTheme(BuildContext context) =>
      Theme.of(context).textTheme;

  static TextStyle? displayLargeTextStyle(BuildContext context) =>
      Theme.of(context).textTheme.displayLarge;

  static TextStyle? headlineLargeTextStyle(BuildContext context) =>
      Theme.of(context).textTheme.headlineLarge;

  static TextStyle? titleLargeTextStyle(BuildContext context) =>
      Theme.of(context).textTheme.titleLarge;

  static TextStyle? titleMediumTextStyle(BuildContext context) =>
      Theme.of(context).textTheme.titleMedium;

  static TextStyle? titleSmallTextStyle(BuildContext context) =>
      Theme.of(context).textTheme.titleSmall;

  static TextStyle? bodyLargeTextStyle(BuildContext context) =>
      Theme.of(context).textTheme.bodyLarge;

  static TextStyle? bodyMediumTextStyle(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium;

  static TextStyle? bodySmallTextStyle(BuildContext context) =>
      Theme.of(context).textTheme.bodySmall;

  static TextStyle? labelLargeTextStyle(BuildContext context) =>
      Theme.of(context).textTheme.labelLarge;

  /// Numeric styles used by calculator / billing screens — not part of the
  /// standard Material type scale but specified explicitly in the PRD.
  static TextStyle grandTotalTextStyle(BuildContext context) =>
      GoogleFonts.inter(
        fontSize: 32.sp,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).colorScheme.primary,
      );

  static TextStyle subtotalTextStyle(BuildContext context) => GoogleFonts.inter(
        fontSize: 22.sp,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).colorScheme.onSurface,
      );

  static TextStyle calculatorNumberTextStyle(BuildContext context) =>
      GoogleFonts.inter(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).colorScheme.onSurface,
      );

  static TextStyle priceTextStyle(BuildContext context) => GoogleFonts.inter(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.onSurface,
      );

  static TextStyle weightTextStyle(BuildContext context) => GoogleFonts.inter(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.onSurface,
      );

  static SystemUiOverlayStyle systemUiOverlayStyle(BuildContext context) =>
      Theme.of(context).appBarTheme.systemOverlayStyle!;
}
