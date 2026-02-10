import 'package:flutter/material.dart';
import 'package:portfolio/utils/app_animations.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/app_spacing.dart';
import 'package:portfolio/widgets/shared/section_title.dart';
import 'package:portfolio/widgets/shared/responsive_container.dart';
import 'package:portfolio/widgets/shared/highlighted_text.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.sectionVerticalDesktop,
      ),
      child: ResponsiveContainer(
        maxWidth: AppSpacing.maxWidthContent,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = AppSpacing.isMobile(constraints.maxWidth);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SectionTitle(
                  number: '01',
                  title: 'About Me',
                  subtitle: 'A bit about who I am and what I do.',
                ),
                SizedBox(height: isMobile ? 24 : 40),
                _buildAboutCard(isMobile),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildAboutCard(bool isMobile) {
    final cardContent = AnimatedContainer(
      duration: AppAnimations.medium,
      curve: AppAnimations.easeOut,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLarge),
        border: Border.all(
          color: AppColors.primary.withValues(
            alpha: _isHovered ? 0.3 : 0.1,
          ),
        ),
        boxShadow: _isHovered
            ? [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.15),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ]
            : null,
      ),
      child: Padding(
        padding: EdgeInsets.all(isMobile ? AppSpacing.cardXL : AppSpacing.cardXXL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFirstParagraph(isMobile),
            SizedBox(height: isMobile ? 16 : 24),
            _buildSecondParagraph(isMobile),
            SizedBox(height: isMobile ? 16 : 24),
            _buildThirdParagraph(isMobile),
          ],
        ),
      ),
    );

    if (isMobile) {
      return cardContent;
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: cardContent,
    );
  }

  Widget _buildFirstParagraph(bool isMobile) {
    final baseStyle = TextStyle(
      fontSize: isMobile ? 15 : 17,
      color: AppColors.textSecondary,
      height: 1.9,
    );

    return FadeInAnimation(
      delay: const Duration(milliseconds: 100),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(
            'Hi. I make apps. ',
            style: baseStyle,
          ),
          HighlightedText(
            text: 'Good ones.',
            baseStyle: baseStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildSecondParagraph(bool isMobile) {
    final baseStyle = TextStyle(
      fontSize: isMobile ? 15 : 17,
      color: AppColors.textSecondary,
      height: 1.9,
    );

    return FadeInAnimation(
      delay: const Duration(milliseconds: 200),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(
            'For the past ',
            style: baseStyle,
          ),
          HighlightedText(
            text: '3 years',
            baseStyle: baseStyle,
          ),
          Text(
            ', I\'ve been building and shipping cross-platform mobile products, from fintech apps to productivity tools, focused on clean architecture, performance, and real user needs.',
            style: baseStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildThirdParagraph(bool isMobile) {
    final baseStyle = TextStyle(
      fontSize: isMobile ? 15 : 17,
      color: AppColors.textSecondary,
      height: 1.9,
    );

    return FadeInAnimation(
      delay: const Duration(milliseconds: 300),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(
            'My philosophy? Write code for ',
            style: baseStyle,
          ),
          HighlightedText(
            text: 'humans first, computers second.',
            baseStyle: baseStyle,
          ),
          Text(
            ' That means clean architecture, helpful error messages, and interfaces that feel natural.',
            style: baseStyle,
          ),
        ],
      ),
    );
  }
}
