import 'package:flutter/material.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

/// Inline highlighted text with a reverse sweep background effect.
/// By default, the text has a colored background (highlighted).
/// On hover, the background sweeps away (clears) from left to right.
class HighlightedText extends StatefulWidget {
  final String text;
  final TextStyle? baseStyle;
  final Color highlightColor;
  final Duration sweepDuration;

  const HighlightedText({
    super.key,
    required this.text,
    this.baseStyle,
    this.highlightColor = AppColors.primary,
    this.sweepDuration = const Duration(milliseconds: 400),
  });

  @override
  State<HighlightedText> createState() => _HighlightedTextState();
}

class _HighlightedTextState extends State<HighlightedText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.sweepDuration,
    );
    // Animation goes from 1.0 (full background) to 0.0 (cleared)
    _animation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _controller.forward(),
      onExit: (_) => _controller.reverse(),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return CustomPaint(
            painter: _HighlightPainter(
              color: widget.highlightColor,
              progress: _animation.value,
            ),
            child: Text(
              widget.text,
              style: GoogleFonts.jetBrainsMono().copyWith(
                fontSize: widget.baseStyle?.fontSize ?? 17,
                height: widget.baseStyle?.height ?? 1.9,
                color: _animation.value < 0.5
                    ? AppColors.primary
                    : AppColors.background,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _HighlightPainter extends CustomPainter {
  final Color color;
  final double progress; // 1.0 = full highlight, 0.0 = cleared

  _HighlightPainter({
    required this.color,
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (progress <= 0) return;

    // Calculate sweep position - sweeps from right to left (revealing/clearing)
    final sweepRight = size.width * progress;

    // Draw the highlight background
    final highlightRect = Rect.fromLTWH(
      0,
      0,
      sweepRight,
      size.height,
    );

    canvas.drawRect(highlightRect, Paint()..color = color);
  }

  @override
  bool shouldRepaint(covariant _HighlightPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.color != color;
  }
}
