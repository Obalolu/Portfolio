import 'package:portfolio/utils/app_spacing.dart';

/// Centralized typography system with responsive font sizes
class AppTypography {
  AppTypography._();

  // Mobile font sizes
  static const double heroMobile = 36;
  static const double nameMobile = 48;
  static const double sectionTitleMobile = 24;
  static const double sectionNumberMobile = 32;
  static const double bodyMobile = 15;
  static const double statMobile = 36;

  // Desktop font sizes
  static const double heroDesktop = 84;
  static const double nameDesktop = 108;
  static const double sectionTitleDesktop = 28;
  static const double sectionNumberDesktop = 40;
  static const double bodyDesktop = 15;
  static const double statDesktop = 48;

  // Helper to get responsive font size
  static double getFontSize(double width, double mobile, double desktop) {
    return AppSpacing.isMobile(width) ? mobile : desktop;
  }

  // Specific helpers for common text sizes
  static double getHeroSize(double width) =>
      getFontSize(width, heroMobile, heroDesktop);

  static double getNameSize(double width) =>
      getFontSize(width, nameMobile, nameDesktop);

  static double getSectionTitleSize(double width) =>
      getFontSize(width, sectionTitleMobile, sectionTitleDesktop);

  static double getSectionNumberSize(double width) =>
      getFontSize(width, sectionNumberMobile, sectionNumberDesktop);

  static double getStatSize(double width) =>
      getFontSize(width, statMobile, statDesktop);
}
