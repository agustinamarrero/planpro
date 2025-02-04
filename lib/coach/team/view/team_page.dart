import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plantelpro/app/bloc/app_bloc.dart';
import 'package:plantelpro/coach/team/bloc/team_bloc.dart';
import 'package:plantelpro_ui/plantelpro_ui.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TeamBloc(),
      child: const TeamView(),
    );
  }
}

class TeamView extends StatelessWidget {
  const TeamView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PLANPROAppBar(
        textTitle: 'Mi plantel',
        centerTitle: false,
        actions: [
          IconButton(
            padding: const EdgeInsets.all(10),
            icon: const Icon(
              Icons.add,
              size: 30,
            ),
            onPressed: () {
              context.push('/coach/add-player');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: PLANPROSpacing.spaceUnit),
            PLANPROFilters(
              options: [
                ...TypeOfPlayer.values.map((e) => e.displayName),
                'Todos',
                'Personalizado',
              ],
              onSelected: (value) {},
            ),
            const SizedBox(height: PLANPROSpacing.spaceUnit),
            PLANPROCard(
              onTap: () {
                context.push('/coach/my-player');
              },
              title: 'Roberto Perez',
              subtitle: 'Delantero',
              imageUrl: 'https://via.placeholder.com/150',
            ),
            PLANPROCard(
              onTap: () {},
              title: 'Juan Lopez',
              imageUrl: 'https://via.placeholder.com/150',
              subtitle: 'Defensa',
            ),
          ],
        ),
      ),
    );
  }
}
