import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plantelpro/coach/my_player/bloc/my_player_bloc.dart';
import 'package:plantelpro_ui/plantelpro_ui.dart';

class MyPlayerPage extends StatelessWidget {
  const MyPlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyPlayerBloc(),
      child: const MyPlayerView(),
    );
  }
}

class MyPlayerView extends StatelessWidget {
  const MyPlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PLANPROAppBar.bigAppBar(
        widgetTitle: Column(
          children: [
            const CircleAvatar(
              backgroundColor: PLANPROColors.primaryGreen,
              radius: 100,
            ),
            const SizedBox(height: PLANPROSpacing.spaceUnit),
            Text(
              'Roberto Perez',
              style: PLANPROTextStyle.headline3.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Delantero',
              style: PLANPROTextStyle.subtitle1,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: PLANPROSpacing.spaceUnit * 2,
            ),
            Row(
              children: [
                Expanded(
                  child: PLANPROCard(
                    title: 'Ver Encuesta',
                    isTitleCentered: true,
                    backgroundColor: PLANPROColors.primaryYellow21,
                    onTap: () => context.push('/player/survey'),
                  ),
                ),
                Expanded(
                  child: PLANPROCard(
                    title: 'Datos Personales',
                    isTitleCentered: true,
                    backgroundColor: PLANPROColors.primaryGreen21,
                    onTap: () => context.push('/player/personal-data'),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: PLANPROCard(
                    title: 'Ficha Médica',
                    isTitleCentered: true,
                    backgroundColor: PLANPROColors.primaryGreen21,
                    onTap: () => context.push('/player/health-player'),
                  ),
                ),
                Expanded(
                  child: PLANPROCard(
                    title: 'Enviar Notificación',
                    isTitleCentered: true,
                    backgroundColor: PLANPROColors.primaryYellow21,
                    onTap: () => context.push('/coach/upload-videos'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: PLANPROSpacing.spaceUnit * 2,
            ),
            const PLANPROCard(
              title: 'Asistencia: 10%',
              backgroundColor: PLANPROColors.secondaryRed,
              isTitleCentered: true,
            ),
          ],
        ),
      ),
    );
  }
}
