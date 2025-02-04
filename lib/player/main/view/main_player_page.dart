import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plantelpro/player/main/bloc/main_player_bloc.dart';
import 'package:plantelpro_ui/plantelpro_ui.dart';

class PlayerMainPage extends StatelessWidget {
  const PlayerMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainPlayerBloc(),
      child: const PlayerMainView(),
    );
  }
}

class PlayerMainView extends StatelessWidget {
  const PlayerMainView({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: PLANPROSpacing.spaceUnit * 2,
            ),
            PLANPROCard(
              onTap: () {
                context.push('/player/survey');
              },
              title: 'Realizar Encuesta',
              backgroundColor: PLANPROColors.secondaryRed,
              trailing: const Icon(
                Icons.assignment_rounded,
                color: PLANPROColors.red100,
                size: PLANPROSpacing.spaceUnit * 2,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: PLANPROCard(
                    onTap: () => context.push('/player/health-player'),
                    title: 'Ficha Médica',
                    isTitleCentered: true,
                    backgroundColor: PLANPROColors.secondary[100]!,
                  ),
                ),
                Expanded(
                  child: PLANPROCard(
                    title: 'Datos Personales',
                    onTap: () => context.push('/player/personal-data'),
                    isTitleCentered: true,
                    backgroundColor: PLANPROColors.secondary[100]!,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(PLANPROSpacing.xlg),
              child: Text(
                'Notificaciones',
                style: PLANPROTextStyle.subtitle1
                    .copyWith(fontWeight: FontWeight.w800),
              ),
            ),
            PLANPROCard(
              title: 'Marcelo Fernandez',
              icon: const Icon(
                Icons.notifications_active,
                color: PLANPROColors.primaryGreen,
                size: PLANPROSpacing.spaceUnit * 2,
              ),
              linkText: 'Link',
              onLinkPressed: () {},
              subtitle:
                  'Para el partido del viernes, les dejo un video importante para que vean!',
            ),
          ],
        ),
      ),
    );
  }
}
