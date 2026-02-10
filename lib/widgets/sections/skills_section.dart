import 'package:flutter/material.dart';
import 'package:portfolio/constants/content.dart';
import 'package:portfolio/models/skill.dart';
import 'package:portfolio/utils/app_spacing.dart';
import 'package:portfolio/widgets/shared/category_tab_bar.dart';
import 'package:portfolio/widgets/shared/section_title.dart';
import 'package:portfolio/widgets/shared/responsive_container.dart';
import 'package:portfolio/widgets/shared/skill_pill.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  SkillCategory _selectedCategory = SkillCategory.all;

  void _onCategorySelected(SkillCategory category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  List<Skill> get _filteredSkills {
    if (_selectedCategory == SkillCategory.all) {
      return AppContent.skills;
    }
    return AppContent.skills
        .where((skill) => skill.category == _selectedCategory)
        .toList();
  }

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
                  number: '02',
                  title: 'Skills & Expertise',
                  subtitle: 'Technologies and tools I work with.',
                ),
                SizedBox(height: isMobile ? 24 : 32),
                CategoryTabBar(
                  selectedCategory: _selectedCategory,
                  onCategorySelected: _onCategorySelected,
                ),
                SizedBox(height: isMobile ? 24 : 40),
                _SkillsGrid(
                  skills: _filteredSkills,
                  key: ValueKey(_selectedCategory),
                  isMobile: isMobile,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _SkillsGrid extends StatelessWidget {
  final List<Skill> skills;
  final bool isMobile;

  const _SkillsGrid({
    super.key,
    required this.skills,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: isMobile ? 10 : 12,
      runSpacing: isMobile ? 10 : 12,
      children: skills.asMap().entries.map((entry) {
        final index = entry.key;
        final skill = entry.value;
        return SkillPill(
          key: ValueKey(skill.name),
          skill: skill,
          delay: Duration(milliseconds: index * 50),
        );
      }).toList(),
    );
  }
}
