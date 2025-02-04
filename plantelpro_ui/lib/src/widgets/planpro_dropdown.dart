import 'package:flutter/material.dart';
import 'package:plantelpro_ui/plantelpro_ui.dart';

class PLANPRODropdown extends StatefulWidget {
  const PLANPRODropdown({
    super.key,
    required this.options,
    required this.onChanged,
    this.hintText = "Seleccione una opción",
    this.initialValue,
  });

  /// Lista de opciones para mostrar en el dropdown.
  final List<String> options;

  /// Callback cuando se selecciona una opción.
  final ValueChanged<String?> onChanged;

  /// Texto sugerido cuando no se selecciona nada.
  final String hintText;

  /// Valor inicial opcional.
  final String? initialValue;

  @override
  _PLANPRODropdownState createState() => _PLANPRODropdownState();
}

class _PLANPRODropdownState extends State<PLANPRODropdown> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(PLANPROSpacing.spaceUnit),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.hintText,
            textAlign: TextAlign.start,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: PLANPROColors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          DropdownButtonFormField<String>(
            value: _selectedValue,
            items: widget.options
                .map(
                  (option) => DropdownMenuItem<String>(
                    value: option,
                    child: Text(
                      option,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) {
              setState(() {
                _selectedValue = value;
              });
              widget.onChanged(value);
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              filled: true,
              fillColor: PLANPROColors.white,
              hintTextDirection: TextDirection.ltr,
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
            ),
            icon: const Icon(
              Icons.arrow_drop_down,
              color: PLANPROColors.lightGrey,
            ),
          ),
        ],
      ),
    );
  }
}
