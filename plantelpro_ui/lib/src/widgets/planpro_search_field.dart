import 'package:flutter/material.dart';
import 'package:plantelpro_ui/plantelpro_ui.dart';

class PLANPROSearchField extends StatefulWidget {
  const PLANPROSearchField({
    super.key,
    required this.items,
    required this.onResults,
    this.hintText = "Buscar...",
  });

  /// Lista inicial de elementos para buscar.
  final List<String> items;

  /// Callback que devuelve los resultados filtrados.
  final ValueChanged<List<String>> onResults;

  /// Texto de sugerencia en el campo de búsqueda.
  final String hintText;

  @override
  _PLANPROSearchFieldState createState() => _PLANPROSearchFieldState();
}

class _PLANPROSearchFieldState extends State<PLANPROSearchField> {
  final TextEditingController _controller = TextEditingController();
  List<String> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = widget.items;
  }

  void _filterItems(String query) {
    final results = widget.items
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();

    setState(() {
      _filteredItems = results;
    });

    widget.onResults(_filteredItems);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      controller: _controller,
      onChanged: _filterItems,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        hintText: widget.hintText,
        hintStyle: theme.textTheme.bodyMedium?.copyWith(
          color: PLANPROColors.lightGrey,
        ),
        filled: true,
        fillColor: PLANPROColors.white,
        suffixIcon: const Icon(
          Icons.search,
          color: PLANPROColors.lightGrey,
        ),
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
      style: theme.textTheme.bodyLarge?.copyWith(
        color: PLANPROColors.black,
      ),
    );
  }
}
