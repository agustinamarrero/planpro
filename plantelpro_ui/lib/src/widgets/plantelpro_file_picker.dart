import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:plantelpro_ui/plantelpro_ui.dart';

class PLANPROFilePicker extends StatelessWidget {
  const PLANPROFilePicker({
    super.key,
    required this.label,
    required this.onFilePicked,
    this.icon = Icons.file_upload_outlined,
    this.borderColor,
    this.iconColor,
    this.labelStyle,
  });

  /// Label displayed above the file picker.
  final String label;

  /// Callback when a file is picked.
  final ValueChanged<PlatformFile?> onFilePicked;

  /// Icon displayed in the file picker.
  final IconData icon;

  /// Border color of the file picker.
  final Color? borderColor;

  /// Color of the icon inside the file picker.
  final Color? iconColor;

  /// Style of the label above the file picker.
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(PLANPROSpacing.spaceUnit),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label
          Text(
            label,
            style: labelStyle ??
                theme.textTheme.bodyMedium?.copyWith(
                  color: PLANPROColors.black,
                  fontWeight: FontWeight.w500,
                ),
          ),
          const SizedBox(height: 8),
          // File Picker
          GestureDetector(
            onTap: () async {
              final pickedFile = await _pickFile();
              onFilePicked(pickedFile);
            },
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: PLANPROColors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: borderColor ?? PLANPROColors.lightGrey,
                  width: 1.5,
                ),
              ),
              child: Center(
                child: Icon(
                  icon,
                  size: 40,
                  color: iconColor ?? PLANPROColors.lightGrey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<PlatformFile?> _pickFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'], // Restrict to PDF files
      );

      if (result != null && result.files.isNotEmpty) {
        return result.files.first; // Return the selected file
      }
    } catch (e) {
      debugPrint("Error picking file: $e");
    }
    return null; // Return null if no file is selected
  }
}
