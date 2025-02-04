import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plantelpro/player/personal_data_player/bloc/personal_data_player_bloc.dart';
import 'package:plantelpro_ui/plantelpro_ui.dart';

class PersonalDataPlayerPage extends StatelessWidget {
  const PersonalDataPlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PersonalDataPlayerBloc(),
      child: const PersonalDataPlayerView(),
    );
  }
}

class PersonalDataPlayerView extends StatelessWidget {
  const PersonalDataPlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PLANPROAppBar(
        textTitle: 'Datos Personales',
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: _PlayerView(),
      ),
    );
  }
}

class _PlayerView extends StatelessWidget {
  const _PlayerView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PLANPROTextField(
          hintText: 'Nombre',
          onChanged: (value) {},
        ),
        PLANPROTextField(
          hintText: 'Email',
          onChanged: (value) {},
        ),
        PLANPROTextField(
          hintText: 'Contraseña',
          onChanged: (value) {},
        ),
        PLANPROTextField(
          hintText: 'Celular',
          onChanged: (value) {},
        ),
        PLANPRODropdown(
          options: const ['lateral', 'defes'],
          onChanged: (value) {},
        ),
        Row(
          children: [
            Expanded(
              child: PLANPROTextField(
                hintText: 'Altura',
                keyboardType: TextInputType.number,
                onChanged: (value) {},
              ),
            ),
            Expanded(
              child: PLANPROTextField(
                hintText: 'Peso',
                keyboardType: TextInputType.number,
                onChanged: (value) {},
              ),
            ),
          ],
        ),
        const SizedBox(
          height: PLANPROSpacing.spaceUnit,
        ),
        PLANPROOutlinedButton.primary(
          text: 'Siguiente',
          onPressed: () {
            context.push('/login/health-data');
          },
        ),
      ],
    );
  }
}
