import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constants/content.dart';
import 'package:portfolio/utils/app_animations.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/app_spacing.dart';
import 'package:portfolio/widgets/shared/availability_badge.dart';
import 'package:portfolio/widgets/shared/email_contact_card.dart';
import 'package:portfolio/widgets/shared/responsive_container.dart';
import 'package:portfolio/widgets/shared/section_title.dart';
import 'package:portfolio/widgets/shared/social_pill.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SectionTitle(
                  number: '06',
                  title: 'Get In Touch',
                  subtitle: 'Let\'s build something together.',
                ),
                SizedBox(height: isMobile ? 24 : 32),
                FadeInAnimation(
                  delay: const Duration(milliseconds: 100),
                  child: Text(
                    AppContent.contactTitle,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: isMobile ? 24 : 28,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
                SizedBox(height: isMobile ? 6 : 8),
                FadeInAnimation(
                  delay: const Duration(milliseconds: 200),
                  child: Text(
                    AppContent.contactSubtitle,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: isMobile ? 24 : 28,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                SizedBox(height: isMobile ? 12 : 16),
                FadeInAnimation(
                  delay: const Duration(milliseconds: 300),
                  child: Text(
                    'I\'m currently open to new opportunities and interesting projects. Feel free to reach out!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: isMobile ? 14 : 15,
                      color: AppColors.textSecondary,
                      height: 1.6,
                    ),
                  ),
                ),
                SizedBox(height: isMobile ? 24 : 32),
                FadeInAnimation(
                  delay: const Duration(milliseconds: 400),
                  child: AvailabilityBadge(status: AppContent.availabilityStatus),
                ),
                SizedBox(height: isMobile ? 24 : 40),
                EmailContactCard(
                  email: AppContent.email,
                  delay: const Duration(milliseconds: 500),
                ),
                SizedBox(height: isMobile ? 24 : 40),
                FadeInAnimation(
                  delay: const Duration(milliseconds: 600),
                  child: Wrap(
                    spacing: isMobile ? 12 : 16,
                    runSpacing: isMobile ? 12 : 16,
                    alignment: WrapAlignment.center,
                    children: [
                      SocialPill(
                        icon: FontAwesomeIcons.linkedin,
                        label: 'LinkedIn',
                        handle: 'in/obalolu',
                        url: AppContent.linkedin,
                        delay: const Duration(milliseconds: 700),
                      ),
                      SocialPill(
                        icon: FontAwesomeIcons.github,
                        label: 'GitHub',
                        handle: 'obalolu',
                        url: AppContent.github,
                        delay: const Duration(milliseconds: 750),
                      ),
                      SocialPill(
                        icon: FontAwesomeIcons.xTwitter,
                        label: 'Twitter',
                        handle: '@treedee07',
                        url: AppContent.twitter,
                        delay: const Duration(milliseconds: 800),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
