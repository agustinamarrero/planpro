import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plantelpro/coach/main/bloc/main_coach_bloc.dart';
import 'package:plantelpro_ui/plantelpro_ui.dart';

class MainCoachPage extends StatelessWidget {
  const MainCoachPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCoachBloc(),
      child: const MainPageView(),
    );
  }
}

class MainPageView extends StatelessWidget {
  const MainPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PLANPROAppBar(
        widgetTitle: ListTile(
          leading: CircleAvatar(
            backgroundColor: PLANPROColors.primaryGreen,
            radius: 20,
          ),
          title: Text(
            'Roberto Perez',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: PLANPROColors.white,
              fontSize: 20,
            ),
          ),
          subtitle: Text(
            'Preparador físico',
            style: TextStyle(
              color: PLANPROColors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const _Options(),
          const SizedBox(
            height: PLANPROSpacing.spaceUnit * 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: PLANPROSpacing.spaceUnit,
            ),
            child: Text(
              'DATOS ÚLTIMO MES',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: PLANPROColors.black,
                  ),
            ),
          ),
          const SizedBox(
            height: PLANPROSpacing.spaceUnit,
          ),
          const Row(
            children: [
              Expanded(
                child: PLANPROCard(
                  title: '100 % ASISTENCIA',
                  isTitleCentered: true,
                  backgroundColor: PLANPROColors.primaryYellow21,
                ),
              ),
              Expanded(
                child: PLANPROCard(
                  title: '100 % ASISTENCIA',
                  isTitleCentered: true,
                  backgroundColor: PLANPROColors.primaryYellow21,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Options extends StatelessWidget {
  const _Options({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: PLANPROSpacing.spaceUnit * 2,
        ),
        BuildActionButton(
          title: 'Mi Plantel',
          icon: const Icon(
            Icons.groups,
            size: 30,
          ),
          onPressed: () {
            context.push('/coach/team');
          },
        ),
        BuildActionButton(
          title: 'Subir videos',
          icon: const Icon(
            Icons.file_upload,
            size: 30,
          ),
          onPressed: () {
            context.push('/coach/upload-videos');
          },
        ),
        // BuildActionButton(
        //   title: 'Ver encuesta',
        //   icon: const Icon(
        //     Icons.assignment_rounded,
        //     size: 30,
        //   ),
        //   onPressed: () {
        //     // Acción para "Ver encuesta"
        //   },
        // ),
        BuildActionButton(
          title: 'Ver asistencia',
          icon: const Icon(
            Icons.event_available,
            size: 30,
          ),
          onPressed: () {
            context.push('/coach/players-assistance');
          },
        ),
      ],
    );
  }
}

class BuildActionButton extends StatelessWidget {
  const BuildActionButton({
    required this.title,
    required this.icon,
    required this.onPressed,
    super.key,
  });
  final String title;
  final Widget icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return PLANPROCard(
      title: title,
      trailing: icon,
      onTap: onPressed,
      backgroundColor: PLANPROColors.primaryGreen21,
    );
  }
}
