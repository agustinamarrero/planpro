import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantelpro/coach/player_assistance/bloc/player_assistance_bloc.dart';
import 'package:plantelpro_ui/plantelpro_ui.dart';

class PlayerAssistancePage extends StatelessWidget {
  const PlayerAssistancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlayerAssistanceBloc(),
      child: const PlayerAssistanceView(),
    );
  }
}

class PlayerAssistanceView extends StatelessWidget {
  const PlayerAssistanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PLANPROAppBar(
        textTitle: 'Ver asistencia',
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    'Asistencia de jugadores',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: PLANPROColors.black,
                        ),
                  ),
                  const SizedBox(height: PLANPROSpacing.spaceUnit),
                  Text(
                    'Filtros',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            const SizedBox(height: PLANPROSpacing.xs),
            const PLANPRODatePicker(label: 'Fecha'),
            PLANPROFiltersOptions(
              onSelected: (index) {
                print('Opción seleccionada: $index');
              },
            ),
            const SizedBox(height: PLANPROSpacing.spaceUnit),
            const Divider(
              color: PLANPROColors.lightGrey,
              thickness: 1,
              endIndent: 20,
              indent: 20,
            ),
            const Column(
              children: [
                PLANPROCard(
                  title: 'Roberto',
                  subtitle: 'Delantero',
                  imageUrl: 'https://via.placeholder.com/150',
                  trailing: Icon(
                    Icons.error,
                    color: PLANPROColors.red,
                    size: 30,
                  ),
                ),
                PLANPROCard(
                  title: 'Juan',
                  subtitle: 'Delantero',
                  imageUrl: 'https://via.placeholder.com/150',
                  trailing: Icon(
                    Icons.add_box,
                    color: PLANPROColors.primaryYellow,
                    size: 30,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
