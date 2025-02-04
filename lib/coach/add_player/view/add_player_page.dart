import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantelpro/app/bloc/app_bloc.dart';
import 'package:plantelpro/coach/add_player/bloc/add_player_bloc.dart';
import 'package:plantelpro_ui/plantelpro_ui.dart';

class AddPlayerPage extends StatelessWidget {
  const AddPlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddPlayerBloc(),
      child: const AddPlayerView(),
    );
  }
}

class AddPlayerView extends StatelessWidget {
  const AddPlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PLANPROAppBar(
        textTitle: 'Agregar jugador',
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: _AddPlayerView(),
      ),
    );
  }
}

class _AddPlayerView extends StatelessWidget {
  const _AddPlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              PLANPROSearchField(
                items: const ['Roberto'],
                onResults: (value) {},
              ),
              const SizedBox(height: PLANPROSpacing.spaceUnit),
              PLANPROFilters(
                options: TypeOfPlayer.values.map((e) => e.displayName).toList(),
                onSelected: (value) {},
              ),
              const SizedBox(height: PLANPROSpacing.spaceUnit),
            ],
          ),
        ),
        PLANPROCard(
          title: 'Roberto Perez',
          subtitle: 'Delantero',
          imageUrl: 'https://via.placeholder.com/150',
          trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
        ),
        PLANPROCard(
          title: 'Juan Lopez',
          imageUrl: 'https://via.placeholder.com/150',
          subtitle: 'Defensa',
          trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
        ),
      ],
    );
  }
}
