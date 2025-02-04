import 'package:flutter/material.dart';
import 'package:plantelpro_ui/plantelpro_ui.dart';

class PLANPROOutlinedButton extends StatelessWidget {
  const PLANPROOutlinedButton({
    super.key,
    this.backgroundColor,
    this.darkBackgroundColor,
    required this.text,
    this.textColor,
    this.onPressed,
    this.borderColor,
    this.icon,
  });

  /// Primary button with a filled green background and white text
  const PLANPROOutlinedButton.primary({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
  })  : backgroundColor = PLANPROColors.primaryGreen,
        darkBackgroundColor = PLANPROColors.primaryGreen21,
        borderColor = PLANPROColors.primaryGreen,
        textColor = PLANPROColors.white;

  /// Secondary button with a white background, green border, and green text
  const PLANPROOutlinedButton.secondary({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
  })  : backgroundColor = PLANPROColors.white,
        darkBackgroundColor = PLANPROColors.lightGrey,
        borderColor = PLANPROColors.primaryGreen,
        textColor = PLANPROColors.primaryGreen;

  /// Text on the button
  final String text;

  /// Callback when the button is pressed
  final VoidCallback? onPressed;

  /// Background color of the button
  final Color? backgroundColor;

  /// Background color of the button in dark mode
  final Color? darkBackgroundColor;

  /// Text color of the button
  final Color? textColor;

  /// Border color of the button
  final Color? borderColor;

  /// Icon on the button
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final isInactive = onPressed == null;
    final theme = Theme.of(context);
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        shape: const StadiumBorder(),
        side: borderColor == null
            ? null
            : BorderSide(
                color: onPressed == null
                    ? (theme.colorScheme.onSurface)
                    : borderColor!,
                width: 2,
              ),
        backgroundColor:
            onPressed == null ? theme.colorScheme.surface : backgroundColor,
        padding: const EdgeInsets.symmetric(
          horizontal: PLANPROSpacing.xlg,
          vertical: PLANPROSpacing.md,
        ),
        shadowColor: Colors.black.withOpacity(0.1),
        elevation: 4,
        minimumSize: const Size(300, 48),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: icon,
            ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: PLANPROTextStyle.button.copyWith(
              color: isInactive ? theme.colorScheme.onSurface : textColor,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
