import 'package:flutter/material.dart';
import 'package:plantelpro_ui/src/colors/plantelpro_colors.dart';

class PLANPROSurveyRating extends StatefulWidget {
  /// Factory para crear un "Sí o No"
  factory PLANPROSurveyRating.yesNo({
    required ValueChanged<int> onRatingSelected,
  }) {
    return PLANPROSurveyRating(
      onRatingSelected: onRatingSelected,
      isBinary: true,
    );
  }

  const PLANPROSurveyRating({
    super.key,
    required this.onRatingSelected,
    this.initialRating = 0,
    this.isBinary = false,
  });

  /// Callback para cuando se selecciona una calificación
  final ValueChanged<int> onRatingSelected;

  /// Calificación inicial
  final int initialRating;

  /// Si es true, muestra opciones binarias (Sí o No)
  final bool isBinary;

  @override
  State<PLANPROSurveyRating> createState() => _SurveyRatingState();
}

class _SurveyRatingState extends State<PLANPROSurveyRating> {
  int _selectedRating = 0;

  @override
  void initState() {
    super.initState();
    _selectedRating = widget.initialRating;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isBinary) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildBinaryOption(label: "Sí", value: 1),
          _buildBinaryOption(label: "No", value: 2),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(5, (index) {
          final rating = index + 1;
          final isSelected = rating == _selectedRating;

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedRating = rating;
              });
              widget.onRatingSelected(rating);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: isSelected
                    ? PLANPROColors.primaryYellow
                    : PLANPROColors.primaryYellow21,
                borderRadius: BorderRadius.circular(12),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: const Offset(0, 4),
                          blurRadius: 8,
                        ),
                      ]
                    : [],
              ),
              alignment: Alignment.center,
              child: Text(
                rating.toString(),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.black : Colors.grey.shade700,
                ),
              ),
            ),
          );
        }),
      );
    }
  }

  Widget _buildBinaryOption({
    required String label,
    required int value,
  }) {
    final isSelected = _selectedRating == value;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedRating = value;
        });
        widget.onRatingSelected(value);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          color: isSelected
              ? PLANPROColors.primaryYellow
              : PLANPROColors.primaryYellow21,
          borderRadius: BorderRadius.circular(12),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(0, 4),
                    blurRadius: 8,
                  ),
                ]
              : [],
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : Colors.grey.shade700,
          ),
        ),
      ),
    );
  }
}
