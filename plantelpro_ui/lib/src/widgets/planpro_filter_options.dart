import 'package:flutter/material.dart';
import 'package:plantelpro_ui/plantelpro_ui.dart';

class PLANPROFiltersOptions extends StatefulWidget {
  const PLANPROFiltersOptions({Key? key, required this.onSelected})
      : super(key: key);

  /// Callback para notificar la opción seleccionada.
  final ValueChanged<int> onSelected;

  @override
  _PLANPROFiltersState createState() => _PLANPROFiltersState();
}

class _PLANPROFiltersState extends State<PLANPROFiltersOptions> {
  int _selectedIndex = -1;

  final List<_FilterOption> _options = [
    _FilterOption(
      text: 'Lesión',
      icon: Icons.error,
      color: PLANPROColors.secondaryRed,
      iconColor: PLANPROColors.red,
    ),
    _FilterOption(
      text: 'Ven. Ficha',
      icon: Icons.add_box,
      color: PLANPROColors.primaryYellow21,
      iconColor: PLANPROColors.primaryYellow,
    ),
    _FilterOption(
      text: 'Problemas Personales',
      icon: Icons.person_off,
      color: Colors.blue.shade100,
      iconColor: Colors.blue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _options.asMap().entries.map((entry) {
          final index = entry.key;
          final option = entry.value;
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
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? option.iconColor : option.color,
                borderRadius: BorderRadius.circular(20),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: option.iconColor.withOpacity(0.3),
                          offset: const Offset(0, 4),
                          blurRadius: 8,
                        ),
                      ]
                    : [],
              ),
              child: Row(
                children: [
                  Icon(
                    option.icon,
                    color: isSelected ? Colors.white : option.iconColor,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    option.text,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.white : Colors.grey.shade800,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _FilterOption {
  _FilterOption({
    required this.text,
    required this.icon,
    required this.color,
    required this.iconColor,
  });
  final String text;
  final IconData icon;
  final Color color;
  final Color iconColor;
}
