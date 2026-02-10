import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/app_animations.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/app_spacing.dart';

/// Large email contact card with copy-to-clipboard functionality
class EmailContactCard extends StatefulWidget {
  final String email;
  final Duration delay;

  const EmailContactCard({
    super.key,
    required this.email,
    this.delay = Duration.zero,
  });

  @override
  State<EmailContactCard> createState() => _EmailContactCardState();
}

class _EmailContactCardState extends State<EmailContactCard> {
  bool _isHovered = false;
  bool _copied = false;
  Timer? _resetTimer;

  @override
  void dispose() {
    _resetTimer?.cancel();
    super.dispose();
  }

  Future<void> _copyEmail() async {
    await Clipboard.setData(ClipboardData(text: widget.email));
    setState(() => _copied = true);

    _resetTimer?.cancel();
    _resetTimer = Timer(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() => _copied = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaleInAnimation(
      delay: widget.delay,
      beginScale: 0.95,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: _copyEmail,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = AppSpacing.isMobile(constraints.maxWidth);

              return AnimatedContainer(
                duration: AppAnimations.fast,
                curve: AppAnimations.easeOut,
                transform: Matrix4.identity()
                  ..scaled(
                    _isHovered ? 1.02 : 1.0,
                    _isHovered ? 1.02 : 1.0,
                    1.0,
                  ),
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 20 : 32,
                  vertical: isMobile ? 20 : 24,
                ),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
                  border: Border.all(
                    color: AppColors.primary.withValues(
                      alpha: _isHovered ? 0.4 : 0.15,
                    ),
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
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      _copied ? FontAwesomeIcons.check : FontAwesomeIcons.envelope,
                      color: _copied
                          ? AppColors.success
                          : AppColors.primary,
                      size: 24,
                    ),
                    SizedBox(width: isMobile ? 12 : 16),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Email',
                            style: GoogleFonts.jetBrainsMono(
                              fontSize: 12,
                              color: AppColors.textTertiary,
                              letterSpacing: 1,
                            ),
                          ),
                          const SizedBox(height: 4),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.email,
                              style: GoogleFonts.jetBrainsMono(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: isMobile ? 16 : 24),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 12 : 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: _isHovered
                            ? AppColors.primary
                            : AppColors.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                      ),
                      child: Text(
                        _copied ? 'Copied!' : 'Copy',
                        style: GoogleFonts.jetBrainsMono(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: _isHovered
                              ? AppColors.background
                              : AppColors.primary,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
