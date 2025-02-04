import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plantelpro_ui/plantelpro_ui.dart';

class PLANPROTextField extends StatelessWidget {
  const PLANPROTextField({
    super.key,
    this.initialValue,
    this.autoFillHints,
    this.controller,
    this.inputFormatters,
    this.autocorrect = true,
    this.readOnly = false,
    this.hintText,
    this.errorText,
    this.prefix,
    this.suffix,
    this.keyboardType,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.obscureText,
    this.widthFactor = 1.0, // Default width factor for full width
  });

  /// A factory constructor for small text fields (half width).
  const PLANPROTextField.small({
    super.key,
    this.initialValue,
    this.autoFillHints,
    this.controller,
    this.inputFormatters,
    this.autocorrect = true,
    this.readOnly = false,
    this.hintText,
    this.errorText,
    this.prefix,
    this.suffix,
    this.keyboardType,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.obscureText,
  }) : widthFactor = 0.5; // Width reduced to half

  /// A value to initialize the field to.
  final String? initialValue;

  /// List of auto fill hints.
  final Iterable<String>? autoFillHints;

  /// Controls the text being edited.
  final TextEditingController? controller;

  /// Optional input validation and formatting overrides.
  final List<TextInputFormatter>? inputFormatters;

  /// Whether to enable autocorrect.
  final bool autocorrect;

  /// Whether the text field should be read-only.
  final bool readOnly;

  /// Text that suggests what sort of input the field accepts.
  final String? hintText;

  /// Text that appears below the field.
  final String? errorText;

  /// A widget that appears before the editable part of the text field.
  final Widget? prefix;

  /// A widget that appears after the editable part of the text field.
  final Widget? suffix;

  /// The type of keyboard to use for editing the text.
  final TextInputType? keyboardType;

  /// Called when the user inserts or deletes texts in the text field.
  final ValueChanged<String>? onChanged;

  /// Called when the text field has been tapped.
  final VoidCallback? onTap;

  /// Called when the user submits the field.
  final ValueChanged<String>? onSubmitted;

  /// Whether the text field should obscure the text being edited.
  final bool? obscureText;

  /// Factor to control the width of the text field.
  final double widthFactor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FractionallySizedBox(
      widthFactor: widthFactor,
      child: Padding(
        padding: const EdgeInsets.all(PLANPROSpacing.spaceUnit),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (hintText != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  hintText!,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: PLANPROColors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            TextFormField(
              key: key,
              initialValue: initialValue,
              controller: controller,
              inputFormatters: inputFormatters,
              keyboardType: keyboardType,
              obscureText: obscureText ?? false,
              autocorrect: autocorrect,
              readOnly: readOnly,
              autofillHints: autoFillHints,
              cursorColor: PLANPROColors.black,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: PLANPROColors.black,
                fontWeight: FontWeight.w500,
              ),
              onFieldSubmitted: onSubmitted,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                filled: true,
                fillColor: PLANPROColors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: PLANPROColors.lightGrey,
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: PLANPROColors.primaryGreen,
                    width: 1.5,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: PLANPROColors.red,
                    width: 1.5,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: PLANPROColors.red,
                    width: 1.5,
                  ),
                ),
                hintText: null,
                errorText: errorText,
                prefixIcon: prefix,
                prefixIconColor: PLANPROColors.lightGrey,
                suffixIcon: suffix,
              ),
              onChanged: onChanged,
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }
}
