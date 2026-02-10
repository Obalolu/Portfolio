import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio/constants/content.dart';
import 'package:portfolio/models/project.dart';
import 'package:portfolio/utils/app_animations.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/app_spacing.dart';
import 'package:portfolio/widgets/shared/section_title.dart';
import 'package:portfolio/widgets/shared/responsive_container.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppSpacing.sectionVerticalDesktop,
      ),
      child: ResponsiveContainer(
        maxWidth: AppSpacing.maxWidthContent,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = AppSpacing.isMobile(constraints.maxWidth);
            final screenWidth = constraints.maxWidth;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SectionTitle(
                  number: '03',
                  title: 'Featured Projects',
                  subtitle: 'Some of the apps I\'ve built.',
                ),
                SizedBox(height: isMobile ? 24 : 40),
                Wrap(
                  spacing: isMobile ? AppSpacing.lg : AppSpacing.xl,
                  runSpacing: isMobile ? AppSpacing.lg : AppSpacing.xl,
                  children: AppContent.projects.asMap().entries.map((entry) {
                    final index = entry.key;
                    final project = entry.value;
                    return ProjectCard(
                      project: project,
                      index: index,
                      isMobile: isMobile,
                      screenWidth: screenWidth,
                    );
                  }).toList(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final Project project;
  final int index;
  final bool isMobile;
  final double screenWidth;

  const ProjectCard({
    super.key,
    required this.project,
    required this.index,
    required this.isMobile,
    required this.screenWidth,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;
  bool _isPressed = false;

  double get _cardWidth {
    if (widget.isMobile) {
      // On mobile, use full width minus padding
      return widget.screenWidth - 40; // 20px padding on each side
    }
    return 368;
  }

  double get _headerHeight => widget.isMobile ? 140 : 180;

  @override
  Widget build(BuildContext context) {
    final accentColor = widget.project.accentColor ?? AppColors.primary;

    // On mobile, use GestureDetector for touch feedback
    // On desktop, use MouseRegion for hover effects
    final cardContent = AnimatedContainer(
      duration: AppAnimations.fast,
      curve: AppAnimations.easeOut,
      transform: Matrix4.identity()..scaled(_isHovered ? 1.02 : 1.0, _isHovered ? 1.02 : 1.0, 1.0),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
        border: Border.all(
          color: accentColor.withValues(alpha: _isHovered ? 0.5 : 0.3),
        ),
        boxShadow: _isHovered
            ? [
                BoxShadow(
                  color: accentColor.withValues(alpha: 0.2),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ]
            : null,
      ),
      child: FadeInAnimation(
        delay: AppAnimations.staggerDelay(widget.index),
        child: SizedBox(
          width: _cardWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Image Section
              _buildHeaderImage(accentColor),
              // Content Section
              Padding(
                padding: EdgeInsets.all(widget.isMobile ? AppSpacing.cardLarge : AppSpacing.cardXL),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Project Name
                    Text(
                      widget.project.name,
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: widget.isMobile ? 17 : 19,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: widget.isMobile ? 8 : 12),
                    // Description
                    Text(
                      widget.project.description,
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: widget.isMobile ? 13 : 14,
                        color: AppColors.textSecondary,
                        height: 1.6,
                      ),
                    ),
                    SizedBox(height: widget.isMobile ? 16 : 20),
                    // Tech Stack
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: widget.project.technologies.map((tech) {
                        return AnimatedContainer(
                          duration: AppAnimations.fast,
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: accentColor.withValues(alpha: _isPressed ? 0.25 : 0.15),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            tech,
                            style: GoogleFonts.jetBrainsMono(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: accentColor,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: widget.isMobile ? 16 : 20),
                    // Impact
                    Container(
                      padding: const EdgeInsets.all(AppSpacing.cardSmall),
                      decoration: BoxDecoration(
                        color: AppColors.success.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(AppSpacing.radiusSmall),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.trending_up,
                            color: AppColors.success,
                            size: 18,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              widget.project.impact,
                              style: GoogleFonts.jetBrainsMono(
                                fontSize: widget.isMobile ? 12 : 13,
                                fontWeight: FontWeight.w500,
                                color: AppColors.success,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: widget.isMobile ? 16 : 20),
                    // CTA Button
                    _buildCtaButton(accentColor),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

    if (widget.isMobile) {
      // Use GestureDetector for touch devices
      return GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        child: cardContent,
      );
    }

    // Use MouseRegion for desktop hover
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: cardContent,
    );
  }

  Widget _buildHeaderImage(Color accentColor) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(AppSpacing.radiusMedium),
        topRight: Radius.circular(AppSpacing.radiusMedium),
      ),
      child: SizedBox(
        height: _headerHeight,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background gradient or image
            _buildBackground(accentColor),
            // Gradient overlay at bottom for smooth transition
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      accentColor.withValues(alpha: 0),
                      AppColors.surface,
                    ],
                  ),
                ),
              ),
            ),
            // App Icon centered
            Center(
              child: AnimatedScale(
                duration: AppAnimations.fast,
                curve: AppAnimations.easeOut,
                scale: _isHovered ? 1.05 : 1.0,
                child: _buildAppIcon(accentColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackground(Color accentColor) {
    // Check if there's an image path or URL
    if (widget.project.imagePath != null) {
      return Image.asset(
        widget.project.imagePath!,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return _buildGradientPlaceholder(accentColor);
        },
      );
    } else if (widget.project.imageUrl != null) {
      return Image.network(
        widget.project.imageUrl!,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return _buildGradientPlaceholder(accentColor);
        },
        errorBuilder: (context, error, stackTrace) {
          return _buildGradientPlaceholder(accentColor);
        },
      );
    }
    return _buildGradientPlaceholder(accentColor);
  }

  Widget _buildGradientPlaceholder(Color accentColor) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            accentColor.withValues(alpha: 0.4),
            accentColor.withValues(alpha: 0.1),
            accentColor.withValues(alpha: 0.3),
          ],
        ),
      ),
      child: CustomPaint(
        size: const Size(double.infinity, double.infinity),
        painter: _DiagonalStripePainter(
          color: accentColor.withValues(alpha: 0.1),
        ),
      ),
    );
  }

  Widget _buildAppIcon(Color accentColor) {
    return AnimatedContainer(
      duration: AppAnimations.medium,
      width: 72,
      height: 72,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            accentColor,
            accentColor.withValues(alpha: 0.7),
          ],
        ),
        borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
        boxShadow: _isHovered
            ? [
                BoxShadow(
                  color: accentColor.withValues(alpha: 0.5),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ]
            : [
                BoxShadow(
                  color: accentColor.withValues(alpha: 0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
      ),
      child: Center(
        child: Text(
          widget.project.name[0],
          style: GoogleFonts.jetBrainsMono(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildCtaButton(Color accentColor) {
    final hasAppStores = widget.project.appStores.isNotEmpty;

    return SizedBox(
      width: double.infinity,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: hasAppStores
              ? () async {
                  final url = widget.project.appStores.first;
                  final uri = Uri.parse(url);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri, mode: LaunchMode.externalApplication);
                  }
                }
              : null,
          child: AnimatedContainer(
            duration: AppAnimations.fast,
            curve: AppAnimations.easeOut,
            padding: EdgeInsets.symmetric(
              vertical: widget.isMobile ? 12 : 14,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: hasAppStores
                    ? [accentColor, accentColor.withValues(alpha: 0.8)]
                    : [
                        AppColors.textSecondary.withValues(alpha: 0.3),
                        AppColors.textSecondary.withValues(alpha: 0.2),
                      ],
              ),
              borderRadius: BorderRadius.circular(AppSpacing.radiusSmall),
              border: Border.all(
                color: hasAppStores
                    ? accentColor.withValues(alpha: 0.5)
                    : AppColors.textSecondary.withValues(alpha: 0.2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'View Project',
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: widget.isMobile ? 13 : 14,
                    fontWeight: FontWeight.w600,
                    color: hasAppStores ? Colors.white : AppColors.textSecondary,
                  ),
                ),
                if (hasAppStores) ...[
                  const SizedBox(width: 8),
                  Icon(
                    Icons.arrow_outward,
                    color: Colors.white,
                    size: widget.isMobile ? 16 : 18,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Custom painter for diagonal stripe pattern
class _DiagonalStripePainter extends CustomPainter {
  final Color color;

  _DiagonalStripePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    const stripeWidth = 8.0;
    const spacing = 20.0;

    // Calculate the number of stripes needed
    final diagonal = size.width + size.height;
    final count = (diagonal / (stripeWidth + spacing)).ceil();

    for (int i = -count; i < count; i++) {
      final offset = i * (stripeWidth + spacing).toDouble();
      final path = Path();

      // Create diagonal stripe
      path.moveTo(offset, 0);
      path.lineTo(offset + stripeWidth, 0);
      path.lineTo(offset + stripeWidth + size.height, size.height);
      path.lineTo(offset + size.height, size.height);
      path.close();

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
