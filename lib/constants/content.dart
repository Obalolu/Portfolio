import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/models/experience.dart';
import 'package:portfolio/models/project.dart';
import 'package:portfolio/models/skill.dart';

class AppContent {
  AppContent._();

  // Developer Info
  static const String name = 'Obalolu \nOkeowo';
  static const String tagline = 'Mobile Developer building fast, \nscalable apps for real users.';
  static const String subtext = 'Flutter • Firebase • Android & iOS • Web';
  static const String location = 'Lagos, Nigeria';

  // Minimal hero stats
  static const String age = '23';
  static const String yearsExperience = '3+';
  static const String projectsWorked = '10+';
  static const String coffees = '∞';

  // Social Links
  static const String github = 'https://github.com/obalolu';
  static const String linkedin = 'https://linkedin.com/in/obalolu';
  static const String twitter = 'https://twitter.com/treedee07';
  static const String email = 'obaokemoney@gmail.com';
  static const String cvUrl = 'assets/cv.pdf';

  // About
  static const String about = '''
Hi. I make apps. Good ones.

For the past 3 years, I’ve been building and shipping cross-platform mobile products—from fintech apps to productivity tools—focused on clean architecture, performance, and real user needs.

My philosophy? Write code for humans first, computers second. That means clean architecture, helpful error messages, and interfaces that feel natural.''';

  // Skills
  static const List<Skill> skills = [
    // Core
    Skill(
      name: 'Flutter',
      icon: FontAwesomeIcons.flutter,
      proficiency: ProficiencyLevel.expert,
      category: SkillCategory.core,
    ),
    Skill(
      name: 'Dart',
      icon: FontAwesomeIcons.code,
      proficiency: ProficiencyLevel.expert,
      category: SkillCategory.core,
    ),

    // State Management
    Skill(
      name: 'Riverpod',
      icon: FontAwesomeIcons.cube,
      proficiency: ProficiencyLevel.expert,
      category: SkillCategory.stateManagement,
    ),
    Skill(
      name: 'BLoC',
      icon: FontAwesomeIcons.barsStaggered,
      proficiency: ProficiencyLevel.expert,
      category: SkillCategory.stateManagement,
    ),
    Skill(
      name: 'Provider',
      icon: FontAwesomeIcons.box,
      proficiency: ProficiencyLevel.proficient,
      category: SkillCategory.stateManagement,
    ),

    // Backend & APIs
    Skill(
      name: 'Firebase',
      icon: FontAwesomeIcons.fire,
      proficiency: ProficiencyLevel.expert,
      category: SkillCategory.backend,
    ),
    Skill(
      name: 'REST APIs',
      icon: FontAwesomeIcons.rightLeft,
      proficiency: ProficiencyLevel.expert,
      category: SkillCategory.backend,
    ),
    Skill(
      name: 'GraphQL',
      icon: FontAwesomeIcons.diagramProject,
      proficiency: ProficiencyLevel.proficient,
      category: SkillCategory.backend,
    ),
    Skill(
      name: 'Dio',
      icon: FontAwesomeIcons.bolt,
      proficiency: ProficiencyLevel.proficient,
      category: SkillCategory.backend,
    ),
    Skill(
      name: 'Hive',
      icon: FontAwesomeIcons.database,
      proficiency: ProficiencyLevel.proficient,
      category: SkillCategory.backend,
    ),

    // Tools
    Skill(
      name: 'Git',
      icon: FontAwesomeIcons.gitAlt,
      proficiency: ProficiencyLevel.expert,
      category: SkillCategory.tools,
    ),
    Skill(
      name: 'GitHub',
      icon: FontAwesomeIcons.github,
      proficiency: ProficiencyLevel.expert,
      category: SkillCategory.tools,
    ),
    Skill(
      name: 'CI/CD',
      icon: FontAwesomeIcons.codeBranch,
      proficiency: ProficiencyLevel.proficient,
      category: SkillCategory.tools,
    ),
    Skill(
      name: 'VS Code',
      icon: FontAwesomeIcons.laptopCode,
      proficiency: ProficiencyLevel.expert,
      category: SkillCategory.tools,
    ),
    Skill(
      name: 'DevTools',
      icon: FontAwesomeIcons.wrench,
      proficiency: ProficiencyLevel.proficient,
      category: SkillCategory.tools,
    ),

    // Testing
    Skill(
      name: 'Unit Tests',
      icon: FontAwesomeIcons.vial,
      proficiency: ProficiencyLevel.proficient,
      category: SkillCategory.testing,
    ),
    Skill(
      name: 'Widget Tests',
      icon: FontAwesomeIcons.mobileScreen,
      proficiency: ProficiencyLevel.proficient,
      category: SkillCategory.testing,
    ),
    Skill(
      name: 'Integration Tests',
      icon: FontAwesomeIcons.microscope,
      proficiency: ProficiencyLevel.proficient,
      category: SkillCategory.testing,
    ),

    // AI Tools
    Skill(
      name: 'Claude Code',
      icon: FontAwesomeIcons.robot,
      proficiency: ProficiencyLevel.proficient,
      category: SkillCategory.ai,
    ),
    Skill(
      name: 'Codex',
      icon: FontAwesomeIcons.commentDots,
      proficiency: ProficiencyLevel.proficient,
      category: SkillCategory.ai,
    ),
    Skill(
      name: 'GitHub Copilot',
      icon: FontAwesomeIcons.github,
      proficiency: ProficiencyLevel.proficient,
      category: SkillCategory.ai,
    ),
    Skill(
      name: 'Cursor',
      icon: FontAwesomeIcons.iCursor,
      proficiency: ProficiencyLevel.proficient,
      category: SkillCategory.ai,
    ),
    Skill(
      name: 'Antigravity',
      icon: FontAwesomeIcons.rocket,
      proficiency: ProficiencyLevel.proficient,
      category: SkillCategory.ai,
    ),
  ];

  // Projects
  static const List<Project> projects = [
    Project(
      name: 'TaskN',
      description: 'A feature-rich productivity super-app for tasks, chat, calendar, and family location sharing.',
      problem: 'Users needed a single platform to manage tasks, collaboration, communication, and location tracking without juggling multiple apps.',
      solution: 'Architected a clean, feature-first Flutter app with real-time collaboration, offline resilience, and deep-link-ready navigation.',
      technologies: [
        'Flutter',
        'Firebase',
        'Firestore',
        'Riverpod',
        'Node.js',
        'OneSignal',
        'ImageKit'
      ],
      impact: 'Multi-module production app with real-time chat, task workflows, and live location tracking',
      appStores: ['https://taskn.org'],
      accentColor: Color(0xFF3B82F6),
      imagePath: 'assets/images/projects/taskn.png',
    ),

    Project(
      name: 'DeWallet',
      description: 'A secure fintech mobile app focused on user authentication, insights, and polished user experience.',
      problem: 'Financial apps require strong security and clear insight into user activity without compromising usability.',
      solution: 'Implemented biometric authentication, secure session handling, and a yearly recap feature with shareable analytics.',
      technologies: [
        'Flutter',
        'Riverpod',
        'Biometric Authentication',
        'REST APIs',
        'Firebase'
      ],
      impact: 'Improved app security, maintainability, and delivered a high-engagement yearly recap feature',
      appStores: ['https://dewallet.app'],
      accentColor: Color(0xFF10B981),
      imagePath: 'assets/images/projects/dewallet.webp',
    ),

    Project(
      name: 'Sellam Mobile',
      description: 'An e-commerce and logistics mobile app with payments, chat, notifications, and delivery tracking.',
      problem: 'Users needed a smooth buying experience with real-time updates, secure payments, and delivery visibility.',
      solution: 'Built responsive UI screens, integrated payments, real-time chat, push notifications, and order tracking.',
      technologies: [
        'Flutter',
        'REST APIs',
        'Payments',
        'Push Notifications',
        'Real-time Chat'
      ],
      impact: 'End-to-end commerce experience with live messaging, payment verification, and delivery tracking',
      appStores: ['https://sellam.ng'],
      accentColor: Color(0xFFF59E0B),
      imagePath: 'assets/images/projects/sellam.png',
    ),

    Project(
      name: 'SCM Daily Scripture Reading',
      description: 'A devotional mobile app delivering daily scripture readings with reminders.',
      problem: 'Users struggled to maintain consistency with daily scripture reading.',
      solution: 'Designed a clean reading experience with push notifications to encourage daily engagement.',
      technologies: [
        'Flutter',
        'Firebase',
        'Push Notifications'
      ],
      impact: 'Long-running production app supporting daily engagement for users since 2021',
      accentColor: Color(0xFF8B5CF6),
    ),
  ];

  // Philosophy
  static const List<PhilosophyItem> philosophy = [
    PhilosophyItem(
      title: 'Clean Architecture',
      description: 'Code is read more than written. I structure apps so they\'re easy to understand, test, and modify.',
      icon: Icons.account_tree,
    ),
    PhilosophyItem(
      title: 'Performance First',
      description: '60fps is non-negotiable. I profile, optimize, and eliminate jank before shipping.',
      icon: Icons.speed,
    ),
    PhilosophyItem(
      title: 'Error Handling',
      description: 'Things fail gracefully. Users should never see cryptic errors or experience crashes.',
      icon: Icons.shield,
    ),
    PhilosophyItem(
      title: 'Team Collaboration',
      description: 'I write code for humans, not machines. Clear naming, documentation, and communication.',
      icon: Icons.groups,
    ),
    PhilosophyItem(
      title: 'User-Centric Design',
      description: 'Mobile apps live in people\'s pockets. I design for thumbs, not cursors. Gesture-friendly, accessible, and delightful.',
      icon: Icons.touch_app,
    ),
    PhilosophyItem(
      title: 'Platform Integration',
      description: 'Great apps feel native. I leverage platform capabilities like haptics, widgets, and share sheets. Going beyond the lowest common denominator.',
      icon: Icons.phone_android,
    ),
    PhilosophyItem(
      title: 'Iterative Delivery',
      description: 'Shipping beats perfect. I release early, measure, and iterate based on real user feedback and analytics.',
      icon: Icons.rocket_launch,
    ),
    PhilosophyItem(
      title: 'Accessibility Matters',
      description: 'Apps should work for everyone. I prioritize screen readers, dynamic type, and contrast from day one, not as an afterthought.',
      icon: Icons.accessibility_new,
    ),
  ];

  // Experience
  // Experience
static const List<Experience> experience = [
  Experience(
    company: 'Magnavisio Technologies',
    role: 'Junior Flutter Engineer',
    duration: 'Feb 2025 – Dec 2025',
    location: 'Remote',
    achievements: [
      'Designed, developed, and maintained cross-platform Flutter applications for multiple client products.',
      'Built modular, feature-based Flutter architecture with reusable components to improve scalability and long-term maintainability.',
      'Implemented secure authentication flows including biometric (fingerprint) authentication, session management, and secure token handling.',
      'Integrated third-party services such as payments, analytics, and push notifications with REST and GraphQL backend APIs.',
      'Led a state-management migration to Riverpod 3.0, improving consistency and reducing technical debt.',
      'Upgraded Flutter SDKs and aligned dependencies across multiple apps, improving build stability and CI reliability.',
      'Collaborated with product and design teams on feature planning, estimation, and delivery.',
    ],
  ),

  Experience(
    company: 'Taskn',
    role: 'Flutter Developer',
    duration: '2025 – Present',
    location: 'Remote',
    achievements: [
      'Architected a feature-first Flutter super-app using Clean Architecture, centralized dependency injection, and deep-link-ready routing.',
      'Built collaborative task and project workflows with multi-member provisioning, dependencies, attachments, and overdue monitoring.',
      'Delivered real-time Firestore-backed chat with optimistic updates, caching, read receipts, and media uploads.',
      'Implemented a Family Locator module supporting live and batched location tracking with permissions and group switching.',
      'Shipped end-to-end push notifications using OneSignal and a Node.js Cloud Run dispatcher.',
    ],
  ),

  Experience(
    company: 'Independent Projects',
    role: 'Flutter Developer',
    duration: '2021 – Present',
    location: 'Remote',
    achievements: [
      'Developed and maintained production Flutter apps including SCM Daily Scripture Reading and AgricTrail Food System Management.',
      'Implemented RESTful API integrations, offline resilience, and data synchronization for agricultural and content-driven applications.',
      'Designed responsive, accessible UIs and ensured consistent behavior across screen sizes and platforms.',
      'Handled testing, debugging, and performance profiling to improve runtime stability and user experience.',
    ],
  ),
];


  // Contact
  static const String contactTitle = 'Have an idea or a role in mind?';
  static const String contactSubtitle = 'Let\'s talk.';
  static const String availabilityStatus = 'Open to opportunities';
}

class PhilosophyItem {
  final String title;
  final String description;
  final IconData icon;

  const PhilosophyItem({
    required this.title,
    required this.description,
    required this.icon,
  });
}
