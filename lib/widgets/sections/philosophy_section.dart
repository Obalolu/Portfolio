import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constants/content.dart';
import 'package:portfolio/utils/app_animations.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/app_spacing.dart';
import 'package:portfolio/widgets/shared/section_title.dart';
import 'package:portfolio/widgets/shared/responsive_container.dart';

class PhilosophySection extends StatelessWidget {
  const PhilosophySection({super.key});

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
            final screenWidth = constraints.maxWidth;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SectionTitle(
                  number: '04',
                  title: 'Engineering Philosophy',
                  subtitle: 'How I think about building software.',
                ),
                SizedBox(height: isMobile ? 24 : 40),
                Wrap(
                  spacing: isMobile ? AppSpacing.md : AppSpacing.lg,
                  runSpacing: isMobile ? AppSpacing.md : AppSpacing.lg,
                  children: AppContent.philosophy.asMap().entries.map((entry) {
                    final index = entry.key;
                    final item = entry.value;
                    return PhilosophyCard(
                      item: item,
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

class PhilosophyCard extends StatefulWidget {
  final PhilosophyItem item;
  final int index;
  final bool isMobile;
  final double screenWidth;

  const PhilosophyCard({
    super.key,
    required this.item,
    required this.index,
    required this.isMobile,
    required this.screenWidth,
  });

  @override
  State<PhilosophyCard> createState() => _PhilosophyCardState();
}

class _PhilosophyCardState extends State<PhilosophyCard>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _iconController;
  late Animation<double> _iconAnimation;

  double get _cardWidth {
    if (widget.isMobile) {
      // On mobile, use almost full width
      return widget.screenWidth - 40;
    }
    return 320;
  }

  @override
  void initState() {
    super.initState();
    _iconController = AnimationController(
      duration: AppAnimations.fast,
      vsync: this,
    );
    _iconAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _iconController,
        curve: AppAnimations.elasticOut,
      ),
    );
  }

  @override
  void dispose() {
    _iconController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cardContent = AnimatedContainer(
      duration: AppAnimations.fast,
      transform: Matrix4.identity()
        ..scaledByDouble(_isHovered ? 1.03 : 1.0, _isHovered ? 1.03 : 1.0, _isHovered ? 1.03 : 1.0, 1.0),
      curve: AppAnimations.easeOut,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: _isHovered ? 0.2 : 0.1),
        ),
        boxShadow: _isHovered
            ? [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.15),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: FadeInAnimation(
        delay: AppAnimations.staggerDelay(widget.index * 2),
        child: Container(
          width: _cardWidth,
          padding: EdgeInsets.all(widget.isMobile ? AppSpacing.cardLarge : AppSpacing.cardXL),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
                ),
                child: AnimatedBuilder(
                  animation: _iconAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: 0.8 + (_iconAnimation.value * 0.2),
                      child: Icon(
                        widget.item.icon,
                        color: AppColors.primary,
                        size: 22,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              Text(
                widget.item.title,
                style: GoogleFonts.jetBrainsMono(
                  fontSize: widget.isMobile ? 16 : 17,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: widget.isMobile ? 10 : 12),
              Text(
                widget.item.description,
                style: GoogleFonts.jetBrainsMono(
                  fontSize: widget.isMobile ? 13 : 14,
                  color: AppColors.textSecondary,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    if (widget.isMobile) {
      // On mobile, just show the card without hover effects
      // The tap interaction triggers the icon animation
      return GestureDetector(
        onTapDown: (_) => _iconController.forward(),
        onTapUp: (_) => Future.delayed(const Duration(milliseconds: 300), () {
          if (mounted) _iconController.reverse();
        }),
        onTapCancel: () => _iconController.reverse(),
        child: cardContent,
      );
    }

    // Use MouseRegion for desktop hover
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _iconController.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _iconController.reverse();
      },
      child: cardContent,
    );
  }
}
