import 'package:flutter/material.dart';
import 'package:rise/theme.dart';

/// Get Started Button - Circular button with arrow icon and border
class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key, required this.onTap});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    final buttonBackgroundColor = colorScheme.onSurface;
    final buttonForegroundColor = colorScheme.surfaceBright;

    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: buttonBackgroundColor,
        radius: 24,
        child: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: buttonBackgroundColor,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: buttonForegroundColor,
              width: 2,
            ),
          ),
          child: Icon(
            Icons.arrow_forward_ios,
            color: buttonForegroundColor,
          ),
        ),
      ),
    );
  }
}

/// Get Started Text - Text with gradient color
class GetStartedText extends StatelessWidget {
  const GetStartedText({super.key});

  static final Shader _linearGradientPaint = const LinearGradient(
    colors: <Color>[Color(0xffBF433F), Color(0xffD8AB28)],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Text.rich(
      style: textTheme.titleLarge?.copyWith(
        color: const Color(0xffA4A4A4),
        height: 1.5,
      ),
      TextSpan(
        children: [
          const TextSpan(text: 'An insanely simple\n'),

          // gradient text (Habit Tracker)
          TextSpan(
            text: 'Habit Tracker',
            style: TextStyle(
              foreground: Paint()..shader = _linearGradientPaint,
            ),
          ),

          const TextSpan(text: ' to track \nyour habits'),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
