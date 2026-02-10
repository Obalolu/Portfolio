import 'package:flutter/material.dart';
import 'package:portfolio/models/skill.dart';
import 'package:portfolio/utils/app_colors.dart';

/// Displays proficiency level as dots (1-3 dots)
class ProficiencyDots extends StatelessWidget {
  final ProficiencyLevel level;
  final double dotSize;
  final double spacing;

  const ProficiencyDots({
    super.key,
    required this.level,
    this.dotSize = 4,
    this.spacing = 4,
  });

  @override
  Widget build(BuildContext context) {
    final count = switch (level) {
      ProficiencyLevel.expert => 3,
      ProficiencyLevel.proficient => 2,
      ProficiencyLevel.familiar => 1,
    };

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        3,
        (index) => Padding(
          padding: EdgeInsets.only(
            right: index < 2 ? spacing : 0,
          ),
          child: _buildDot(index < count),
        ),
      ),
    );
  }

  Widget _buildDot(bool isActive) {
    return Container(
      width: dotSize,
      height: dotSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? AppColors.primary : AppColors.surfaceLight,
      ),
    );
  }
}
