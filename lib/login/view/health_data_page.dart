import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantelpro/login/login.dart';
import 'package:plantelpro_ui/plantelpro_ui.dart';

class HealthDataPage extends StatelessWidget {
  const HealthDataPage({super.key});

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
            PLANPRODatePicker(
              label: 'Vencimiento',
              onDateSelected: (value) {
                context.read<LoginBloc>().add(
                      LoginHealthFieldChanged(
                        fieldName: 'medicalExpiration',
                        value: value.toIso8601String(),
                      ),
                    );
              },
            ),
            const SizedBox(height: PLANPROSpacing.spaceUnit),
            PLANPROFilePicker(
              label: 'Adjuntar archivo',
              onFilePicked: (file) {
                context.read<LoginBloc>().add(
                      LoginHealthFieldChanged(
                        fieldName: 'medicalFile',
                        value: file!.path!,
                      ),
                    );
              },
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
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            PLANPRODatePicker(
              label: 'Año',
              onDateSelected: (value) {
                context.read<LoginBloc>().add(
                      LoginHealthFieldChanged(
                        fieldName: 'injuryYear',
                        value: value.toIso8601String(),
                      ),
                    );
              },
            ),
            const SizedBox(height: PLANPROSpacing.spaceUnit),
            PLANPROMultilineInput(
              hintText: 'Observaciones',
              onChanged: (value) {
                context.read<LoginBloc>().add(
                      LoginHealthFieldChanged(
                        fieldName: 'injuryObservations',
                        value: value,
                      ),
                    );
              },
            ),
            const SizedBox(height: PLANPROSpacing.spaceUnit),
            Center(
              child: PLANPROOutlinedButton.primary(
                text: 'Aceptar',
                onPressed: () {
                  // context.go('/player');
                  context.read<LoginBloc>().add(LoginSubmitted());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
