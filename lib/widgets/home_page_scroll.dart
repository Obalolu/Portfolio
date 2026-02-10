import 'package:flutter/material.dart';
import 'package:portfolio/constants/content.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/app_spacing.dart';
import 'package:portfolio/widgets/sections/about_section.dart';
import 'package:portfolio/widgets/sections/contact_section.dart';
import 'package:portfolio/widgets/sections/experience_section.dart';
import 'package:portfolio/widgets/sections/hero_section.dart';
import 'package:portfolio/widgets/sections/philosophy_section.dart';
import 'package:portfolio/widgets/sections/projects_section.dart';
import 'package:portfolio/widgets/sections/skills_section.dart';
import 'package:portfolio/widgets/shared/responsive_container.dart';

// Option A: Single Page with Smooth Scrolling
class ScrollHomePage extends StatefulWidget {
  const ScrollHomePage({super.key});

  @override
  State<ScrollHomePage> createState() => _ScrollHomePageState();
}

class _ScrollHomePageState extends State<ScrollHomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _philosophyKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(int index) {
    final keys = [
      _aboutKey,
      _skillsKey,
      _projectsKey,
      _philosophyKey,
      _experienceKey,
      _contactKey,
    ];

    if (index >= 0 && index < keys.length) {
      final key = keys[index];
      final RenderObject? renderObject = key.currentContext?.findRenderObject();
      if (renderObject is RenderBox) {
        final position = renderObject.localToGlobal(Offset.zero).dy;
        final currentOffset = _scrollController.offset;
        final headerHeight = 56; // Fixed header height for scroll offset
        final targetOffset = currentOffset + position - headerHeight;
        _scrollController.animateTo(
          targetOffset.clamp(0.0, _scrollController.position.maxScrollExtent),
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          // App Bar (appears on scroll) with constrained width
          SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: _NavDelegate(
              scrollToSection: _scrollToSection,
            ),
          ),
          // Content Sections
          const SliverToBoxAdapter(child: HeroSection()),
          SliverToBoxAdapter(key: _aboutKey, child: AboutSection()),
          SliverToBoxAdapter(key: _skillsKey, child: SkillsSection()),
          SliverToBoxAdapter(key: _projectsKey, child: ProjectsSection()),
          SliverToBoxAdapter(key: _philosophyKey, child: PhilosophySection()),
          SliverToBoxAdapter(key: _experienceKey, child: ExperienceSection()),
          SliverToBoxAdapter(key: _contactKey, child: ContactSection()),
          // Footer
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(24),
              alignment: Alignment.center,
              child: Text(
                '© 2026 ${AppContent.name.split('\n')[0]}. Built with Flutter.',
                style: TextStyle(
                  color: AppColors.textTertiary,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavDelegate extends SliverPersistentHeaderDelegate {
  final Function(int) scrollToSection;

  _NavDelegate({required this.scrollToSection});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = AppSpacing.isMobile(constraints.maxWidth);

        return Container(
          color: AppColors.background,
          child: ResponsiveContainer(
            maxWidth: 1200,
            child: isMobile
                ? _buildMobileHeader()
                : _buildDesktopHeader(scrollToSection),
          ),
        );
      },
    );
  }

  Widget _buildMobileHeader() {
    return Container(
      height: 48,
      alignment: Alignment.center,
      child: Text(
        AppContent.name.split('\n')[0],
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }

  Widget _buildDesktopHeader(Function(int) scrollToSection) {
    return Row(
      children: [
        Text(
          AppContent.name.split('\n')[0],
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: AppColors.textPrimary,
          ),
        ),
        const Spacer(),
        _AnimatedNavButton(
          label: 'About',
          onTap: () => scrollToSection(0),
        ),
        _AnimatedNavButton(
          label: 'Skills',
          onTap: () => scrollToSection(1),
        ),
        _AnimatedNavButton(
          label: 'Projects',
          onTap: () => scrollToSection(2),
        ),
        _AnimatedNavButton(
          label: 'Philosophy',
          onTap: () => scrollToSection(3),
        ),
        _AnimatedNavButton(
          label: 'Experience',
          onTap: () => scrollToSection(4),
        ),
        _AnimatedNavButton(
          label: 'Contact',
          onTap: () => scrollToSection(5),
        ),
      ],
    );
  }

  @override
  double get maxExtent => 56;

  @override
  double get minExtent => 56;

  @override
  bool shouldRebuild(covariant _NavDelegate oldDelegate) => false;
}

class _AnimatedNavButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _AnimatedNavButton({
    required this.label,
    required this.onTap,
  });

  @override
  State<_AnimatedNavButton> createState() => _AnimatedNavButtonState();
}

class _AnimatedNavButtonState extends State<_AnimatedNavButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        height: 40,
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: widget.onTap,
              child: Text(
                widget.label,
                style: TextStyle(
                  color: _isHovered ? AppColors.primary : AppColors.textSecondary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: _isHovered ? 24 : 0,
              height: 2,
              color: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
