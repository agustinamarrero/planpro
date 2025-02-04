import 'package:flutter/material.dart';
import 'package:plantelpro_ui/src/colors/plantelpro_colors.dart';

class PLANPROSwitch extends StatefulWidget {
  const PLANPROSwitch({
    super.key,
    required this.options,
    required this.onChanged,
    this.initialIndex = 0,
  });

  /// Opciones del interruptor (por ejemplo, ["Coach", "Jugador"]).
  final List<String> options;

  /// Índice inicial seleccionado (por defecto 0).
  final int initialIndex;

  /// Callback que devuelve la opción seleccionada.
  final ValueChanged<int> onChanged;

  @override
  _PLANPROSwitchState createState() => _PLANPROSwitchState();
}

class _PLANPROSwitchState extends State<PLANPROSwitch> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: PLANPROColors.primaryYellow21,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          // Selector deslizante
          AnimatedAlign(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            alignment: Alignment(
              -1 + (_selectedIndex * 2 / (widget.options.length - 1)),
              0,
            ),
            child: FractionallySizedBox(
              widthFactor: 1 / widget.options.length,
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: PLANPROColors.primaryYellow,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          // Texto y detectores de toque
          Row(
            children: List.generate(widget.options.length, (index) {
              final isSelected = _selectedIndex == index;

              return Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                    widget.onChanged(index);
                  },
                  child: Center(
                    child: AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 200),
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      child: Text(widget.options[index]),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
