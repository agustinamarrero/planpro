import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantelpro/app/bloc/app_bloc.dart';
import 'package:plantelpro/coach/upload_videos/upload_videos.dart';
import 'package:plantelpro_ui/plantelpro_ui.dart';

class UploadVideosPage extends StatelessWidget {
  const UploadVideosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UploadVideosBloc(),
      child: const UploadVideosView(),
    );
  }
}

class UploadVideosView extends StatelessWidget {
  const UploadVideosView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PLANPROAppBar(
        textTitle: 'Videos',
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                'Sube videos para tu plantel',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: PLANPROColors.black,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                'Se enviará una notificación a los jugadores',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: PLANPROColors.black,
                    ),
              ),
            ),
            const PLANPROMultilineInput(
              hintText: 'mensaje',
            ),
            const SizedBox(height: PLANPROSpacing.spaceUnit),
            const PLANPROTextField(
              hintText: 'URL del video',
            ),
            const SizedBox(height: PLANPROSpacing.spaceUnit),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                'destinatarios',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: PLANPROColors.black,
                    ),
              ),
            ),
            PLANPROFilters(
              options: [
                ...TypeOfPlayer.values.map((e) => e.displayName),
                'Todos',
                'Personalizado',
              ],
              onSelected: (value) {},
            ),
            const SizedBox(height: PLANPROSpacing.spaceUnit),
            Padding(
              padding: const EdgeInsets.all(12),
              child: PLANPROOutlinedButton.primary(
                text: 'Subir video',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
