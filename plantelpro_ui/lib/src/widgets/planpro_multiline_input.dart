import 'package:flutter/material.dart';
import 'package:plantelpro_ui/plantelpro_ui.dart';

class PLANPROMultilineInput extends StatelessWidget {
  const PLANPROMultilineInput({
    super.key,
    this.label,
    this.hintText,
    this.controller,
    this.maxLines = 3,
    this.onChanged,
    this.errorText,
  });

  /// Etiqueta que se muestra arriba del campo de entrada.
  final String? label;

  /// Texto de sugerencia dentro del campo.
  final String? hintText;

  /// Controlador del texto.
  final TextEditingController? controller;

  /// Número máximo de líneas del campo.
  final int maxLines;

  /// Callback cuando el texto cambia.
  final ValueChanged<String>? onChanged;

  /// Texto de error que aparece debajo del campo.
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(PLANPROSpacing.spaceUnit),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                label!,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: PLANPROColors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          TextFormField(
            controller: controller,
            maxLines: maxLines,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: PLANPROColors.black,
              fontWeight: FontWeight.w500,
            ),
            cursorColor: PLANPROColors.black,
            onChanged: onChanged,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              hintText: hintText,
              hintStyle: theme.textTheme.bodyMedium?.copyWith(
                color: PLANPROColors.lightGrey,
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
              errorText: errorText,
            ),
          ),
        ],
      ),
    );
  }
}
