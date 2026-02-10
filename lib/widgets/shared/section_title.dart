import 'package:flutter/material.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/app_spacing.dart';
import 'package:portfolio/utils/app_typography.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionTitle extends StatelessWidget {
  final String number;
  final String title;
  final String? subtitle;

  const SectionTitle({
    super.key,
    required this.number,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = AppSpacing.isMobile(constraints.maxWidth);
        final horizontalPadding = AppSpacing.getHorizontalPadding(constraints.maxWidth);

        return Padding(
          padding: EdgeInsets.only(left: horizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    number,
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: AppTypography.getSectionNumberSize(constraints.maxWidth),
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary.withValues(alpha: 0.3),
                      height: 1,
                    ),
                  ),
                  SizedBox(width: isMobile ? 12 : 20),
                  Expanded(
                    child: Container(
                      height: 1,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.primary.withValues(alpha: 0.5),
                            AppColors.primary.withValues(alpha: 0),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: isMobile ? 8 : 12),
              Text(
                title,
                style: GoogleFonts.jetBrainsMono(
                  fontSize: AppTypography.getSectionTitleSize(constraints.maxWidth),
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              if (subtitle != null) ...[
                SizedBox(height: isMobile ? 8 : 12),
                Text(
                  subtitle!,
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: isMobile ? 14 : 15,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
