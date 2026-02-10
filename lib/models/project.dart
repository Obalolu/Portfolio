import 'package:flutter/material.dart';

class Project {
  final String name;
  final String description;
  final String? problem;
  final String? solution;
  final List<String> technologies;
  final String impact;
  /// URLs for app stores or project links (e.g., Play Store, App Store, GitHub)
  /// Used for the CTA button on the project card
  final List<String> appStores;
  final Color? accentColor;
  final String? imagePath;
  final String? imageUrl;

  const Project({
    required this.name,
    required this.description,
    this.problem,
    this.solution,
    required this.technologies,
    required this.impact,
    this.appStores = const [],
    this.accentColor,
    this.imagePath,
    this.imageUrl,
  });
}
