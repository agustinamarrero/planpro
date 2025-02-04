import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plantelpro/player/health_player/bloc/health_player_bloc.dart';
import 'package:plantelpro_ui/plantelpro_ui.dart';

class HealthPlayerPage extends StatelessWidget {
  const HealthPlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HealthPlayerBloc(),
      child: const HealthPlayerView(),
    );
  }
}

class HealthPlayerView extends StatelessWidget {
  const HealthPlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PLANPROAppBar(
        textTitle: 'Datos de Salud',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(PLANPROSpacing.spaceUnit),
              child: Text(
                'Ficha médica',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: PLANPROColors.black,
                    ),
              ),
            ),
            PLANPROTextField(
              hintText: 'Vencimiento',
              prefix: const Icon(Icons.calendar_today),
              onChanged: (value) {},
            ),
            const SizedBox(height: PLANPROSpacing.spaceUnit),
            PLANPROFilePicker(
              label: 'Adjuntar archivo',
              onFilePicked: (file) {},
            ),
            Padding(
              padding: const EdgeInsets.all(PLANPROSpacing.spaceUnit),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Lesiones Previas',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: PLANPROColors.black,
                        ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    color: PLANPROColors.primaryGreen,
                    onPressed: () {
                      // Agregar lógica para añadir una lesión previa
                    },
                  ),
                ],
              ),
            ),
            PLANPROTextField(
              hintText: 'Año',
              prefix: const Icon(Icons.calendar_today),
              keyboardType: TextInputType.number,
              onChanged: (value) {},
            ),
            const SizedBox(height: PLANPROSpacing.spaceUnit),
            PLANPROMultilineInput(
              hintText: 'Observaciones',
              onChanged: (value) {},
            ),
            const SizedBox(height: PLANPROSpacing.spaceUnit),
            Center(
              child: PLANPROOutlinedButton.primary(
                text: 'Guardar',
                onPressed: () {
                  context.pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
