import 'package:flutter/material.dart';
import 'package:plantelpro_ui/src/colors/plantelpro_colors.dart';

class PLANPROFilters extends StatefulWidget {
  const PLANPROFilters({
    super.key,
    required this.options,
    required this.onSelected,
    this.initialSelectedIndex = 0,
  });

  /// Lista de opciones para mostrar como botones.
  final List<String> options;

  /// Callback para notificar la opción seleccionada.
  final ValueChanged<int> onSelected;

  /// Índice inicial de la opción seleccionada.
  final int initialSelectedIndex;

  @override
  PLANPROFiltersState createState() => PLANPROFiltersState();
}

class PLANPROFiltersState extends State<PLANPROFilters> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialSelectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.options.asMap().entries.map((entry) {
          final index = entry.key;
          final text = entry.value;
          final isSelected = index == _selectedIndex;

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
              widget.onSelected(index);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(horizontal: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected
                    ? PLANPROColors.primaryGreen
                    : PLANPROColors.primaryGreen21,
                borderRadius: BorderRadius.circular(20),
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
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  color:
                      isSelected ? PLANPROColors.white : Colors.grey.shade700,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
