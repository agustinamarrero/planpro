import 'package:flutter/material.dart';
import 'package:plantelpro_ui/plantelpro_ui.dart';

class PLANPRODatePicker extends StatelessWidget {
  const PLANPRODatePicker({
    super.key,
    required this.label,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.onDateSelected,
    this.errorText,
  });

  /// Label displayed above the date picker.
  final String label;

  /// Initial date to display in the picker.
  final DateTime? initialDate;

  /// The earliest date the user can select.
  final DateTime? firstDate;

  /// The latest date the user can select.
  final DateTime? lastDate;

  /// Callback when the user selects a date.
  final ValueChanged<DateTime>? onDateSelected;

  /// Error text displayed below the field.
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final TextEditingController controller = TextEditingController(
      text: initialDate != null
          ? '${initialDate!.day}/${initialDate!.month}/${initialDate!.year}'
          : '',
    );

    return Padding(
      padding: const EdgeInsets.all(PLANPROSpacing.spaceUnit),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              label,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: PLANPROColors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          TextFormField(
            key: key,
            controller: controller,
            readOnly: true,
            cursorColor: PLANPROColors.black,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: PLANPROColors.black,
              fontWeight: FontWeight.w500,
            ),
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
              errorText: errorText,
              prefixIcon: const Icon(
                Icons.calendar_today_outlined,
                color: PLANPROColors.lightGrey,
              ),
            ),
            onTap: () async {
              final selectedDate = await showDatePicker(
                context: context,
                initialDate: initialDate ?? DateTime.now(),
                firstDate: firstDate ?? DateTime(1900),
                lastDate: lastDate ?? DateTime(2100),
              );

              if (selectedDate != null) {
                controller.text =
                    '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
                onDateSelected?.call(selectedDate);
              }
            },
          ),
        ],
      ),
    );
  }
}
