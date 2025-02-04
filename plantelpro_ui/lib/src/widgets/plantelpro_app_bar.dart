import 'package:flutter/material.dart';
import 'package:plantelpro_ui/src/colors/plantelpro_colors.dart';

/// A custom app bar widget with rounded corners and primary color.
class PLANPROAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PLANPROAppBar({
    super.key,
    this.widgetTitle,
    this.textTitle,
    this.titleTextStyle,
    this.leading,
    this.elevation,
    this.centerTitle,
    this.toolbarHeight = kToolbarHeight,
    this.leadingWidth,
    this.actions,
    this.automaticallyImplyLeading = true,
  });

  /// Factory constructor for a large AppBar with a height of 300.
  const PLANPROAppBar.bigAppBar({
    super.key,
    this.textTitle,
    this.widgetTitle,
    this.titleTextStyle,
    this.leading,
    this.elevation = 0,
    this.centerTitle = true,
    this.leadingWidth,
    this.actions,
  })  : toolbarHeight = 350,
        automaticallyImplyLeading = false;

  /// The text for the title of the app bar is a Text.
  final String? textTitle;

  /// The title of the app bar.
  final Widget? widgetTitle;

  /// The style of the title text.
  final TextStyle? titleTextStyle;

  /// The leading widget of the app bar.
  final Widget? leading;

  /// The elevation of the app bar.
  final double? elevation;

  /// Whether the title should be centered.
  final bool? centerTitle;

  /// The height of the app bar.
  final double toolbarHeight;

  /// The width of the leading widget.
  final double? leadingWidth;

  /// The actions of the app bar.
  final List<Widget>? actions;

  /// Whether the leading widget should be automatically implied.
  final bool automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(16),
        ),
        boxShadow: [
          if (elevation != null)
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(0, elevation!),
              blurRadius: elevation! * 2,
            ),
        ],
      ),
      child: AppBar(
        title: widgetTitle ??
            Text(
              textTitle ?? '',
              style: titleTextStyle ??
                  Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
                        color: PLANPROColors.white,
                        fontWeight: FontWeight.bold,
                      ) ??
                  const TextStyle(
                    color: PLANPROColors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
            ),
        titleTextStyle: titleTextStyle ??
            Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
                  color: PLANPROColors.white,
                  fontWeight: FontWeight.bold,
                ),
        leading: leading,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: centerTitle,
        toolbarHeight: toolbarHeight,
        leadingWidth: leadingWidth,
        actions: actions,
        automaticallyImplyLeading: automaticallyImplyLeading,
        actionsIconTheme: const IconThemeData(color: PLANPROColors.white),
        iconTheme: const IconThemeData(color: PLANPROColors.white),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}
