import 'package:flutter/material.dart';

class PLANPROCard extends StatelessWidget {
  /// Factory para crear una tarjeta de notificación.
  factory PLANPROCard.notification({
    required String title,
    required String subtitle,
    required String linkText,
    required VoidCallback onLinkPressed,
    required VoidCallback onTap, // Callback al tocar toda la tarjeta
  }) {
    return PLANPROCard(
      title: title,
      subtitle: subtitle,
      linkText: linkText,
      onLinkPressed: onLinkPressed,
      onTap: onTap,
      icon: const Icon(Icons.notifications, color: Colors.green),
    );
  }

  const PLANPROCard({
    super.key,
    required this.title,
    this.subtitle,
    this.imageUrl,
    this.trailing,
    this.linkText,
    this.icon,
    this.onLinkPressed,
    this.onTap,
    this.backgroundColor = Colors.white,
    this.isTitleCentered = false,
  });

  /// Título principal de la tarjeta.
  final String title;

  /// Subtítulo opcional.
  final String? subtitle;

  /// URL de la imagen (opcional).
  final String? imageUrl;

  /// Widget opcional para mostrar al final de la fila.
  final Widget? trailing;

  /// Color de fondo de la tarjeta.
  final Color backgroundColor;

  /// Si el título debe estar centrado.
  final bool isTitleCentered;

  /// Texto del enlace (opcional).
  final String? linkText;

  /// Acción al presionar el enlace.
  final VoidCallback? onLinkPressed;

  /// Icono opcional para la tarjeta.
  final Widget? icon;

  /// Acción al presionar toda la tarjeta.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Hace que toda la tarjeta sea interactiva
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        padding: const EdgeInsets.all(16.0),
        constraints: const BoxConstraints(
          minHeight: 80,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 4),
              blurRadius: 8,
            ),
          ],
        ),
        child: isTitleCentered
            ? Center(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                  textAlign: TextAlign.center,
                ),
              )
            : Row(
                children: [
                  if (imageUrl != null)
                    // Imagen circular (opcional)
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          imageUrl!,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 50,
                              height: 50,
                              color: Colors.grey.shade300,
                              child: const Icon(
                                Icons.person,
                                size: 30,
                                color: Colors.grey,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  if (icon != null) icon!,
                  const SizedBox(width: 12),
                  // Información de texto
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Título
                        Text(
                          title,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        // Subtítulo (opcional)
                        if (subtitle != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              subtitle!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                            ),
                          ),
                        const SizedBox(height: 8),
                        // Enlace
                        if (linkText != null)
                          GestureDetector(
                            onTap: onLinkPressed,
                            child: Text(
                              linkText!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  // Widget opcional al final de la fila
                  if (trailing != null) trailing!,
                ],
              ),
      ),
    );
  }
}
