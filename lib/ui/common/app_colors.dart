import 'package:flutter/material.dart';

/// WeightMate color palette.
///
/// Colors are grouped by role (brand, semantic, light theme, dark theme) to
/// mirror the design tokens defined in the WeightMate Theme Design PRD.
/// Prefer accessing these through [AppTheme] / [AppColorsExtension] in
/// widgets so the correct light/dark value is picked up automatically —
/// use these raw constants only where a `const Color` is required
/// (e.g. inside another const constructor).

// ---------------------------------------------------------------------------
// Brand colors
// ---------------------------------------------------------------------------

const Color kcPrimaryColor = Color(0xFF2E7D32); // Primary (Green)
const Color kcPrimaryColorLight = Color(0xFF66BB6A); // Primary Light
const Color kcPrimaryContainer = Color(0xFFE8F5E9); // Primary Container
const Color kcSecondaryColor = Color(0xFF4CAF50); // Secondary
const Color kcAccentColor = Color(0xFFFF9800); // Accent / CTA

// ---------------------------------------------------------------------------
// Semantic colors (shared defaults — light theme values)
// ---------------------------------------------------------------------------

const Color kcSuccessColor = Color(0xFF16A34A);
const Color kcWarningColor = Color(0xFFFB8C00);
const Color kcErrorColor = Color(0xFFDC2626);
const Color kcInfoColor = Color(0xFF2196F3);

// ---------------------------------------------------------------------------
// Light theme
// ---------------------------------------------------------------------------

const Color kcLightBackground = Color(0xFFF8FAFC);
const Color kcLightSurface = Color(0xFFFFFFFF);
const Color kcLightCard = Color(0xFFFFFFFF);
const Color kcLightSurfaceVariant = Color(0xFFF3F4F6);
const Color kcLightPrimaryText = Color(0xFF111827);
const Color kcLightSecondaryText = Color(0xFF6B7280);
const Color kcLightHintText = Color(0xFF94A3B8);
const Color kcLightDisabled = Color(0xFF9CA3AF);
const Color kcLightBorder = Color(0xFFE5E7EB);
const Color kcLightDivider = Color(0xFFE2E8F0);

// ---------------------------------------------------------------------------
// Dark theme
// ---------------------------------------------------------------------------

const Color kcDarkBackground = Color(0xFF101418);
const Color kcDarkSurface = Color(0xFF1B1F23);
const Color kcDarkCard = Color(0xFF20262C);
const Color kcDarkSurfaceVariant = Color(0xFF293038);
const Color kcDarkPrimary = Color(0xFF66BB6A);
const Color kcDarkPrimaryContainer = Color(0xFF1B5E20);
const Color kcDarkSecondary = Color(0xFF81C784);
const Color kcDarkAccent = Color(0xFFFFB74D);
const Color kcDarkPrimaryText = Color(0xFFF5F5F5);
const Color kcDarkSecondaryText = Color(0xFFB0BEC5);
const Color kcDarkHintText = Color(0xFF90A4AE);
const Color kcDarkDisabled = Color(0xFF78909C);
const Color kcDarkBorder = Color(0xFF343A40);
const Color kcDarkDivider = Color(0xFF2D333B);

const Color kcDarkSuccess = Color(0xFF66BB6A);
const Color kcDarkWarning = Color(0xFFFFB74D);
const Color kcDarkError = Color(0xFFEF5350);
const Color kcDarkInfo = Color(0xFF42A5F5);

// ---------------------------------------------------------------------------
// Neutral aliases (kept for backwards compatibility with older widgets that
// referenced these generic greyscale names).
// ---------------------------------------------------------------------------

const Color kcDarkGreyColor = kcDarkSurface;
const Color kcMediumGrey = kcLightSecondaryText;
const Color kcLightGrey = kcLightHintText;
const Color kcVeryLightGrey = kcLightSurfaceVariant;
const Color kcBackgroundColor = kcLightBackground;
