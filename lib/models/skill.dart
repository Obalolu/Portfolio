import 'package:flutter/material.dart';

enum ProficiencyLevel { expert, proficient, familiar }

enum SkillCategory {
  all,
  core,
  stateManagement,
  backend,
  tools,
  testing,
  ai,
}

extension SkillCategoryExtension on SkillCategory {
  String get displayName {
    switch (this) {
      case SkillCategory.all:
        return 'All';
      case SkillCategory.core:
        return 'Core';
      case SkillCategory.stateManagement:
        return 'State Management';
      case SkillCategory.backend:
        return 'Backend';
      case SkillCategory.tools:
        return 'Tools';
      case SkillCategory.testing:
        return 'Testing';
      case SkillCategory.ai:
        return 'AI Tools';
    }
  }
}

class Skill {
  final String name;
  final IconData icon;
  final ProficiencyLevel proficiency;
  final SkillCategory category;

  const Skill({
    required this.name,
    required this.icon,
    required this.proficiency,
    required this.category,
  });

  int get dotCount => switch (proficiency) {
    ProficiencyLevel.expert => 3,
    ProficiencyLevel.proficient => 2,
    ProficiencyLevel.familiar => 1,
  };
}
