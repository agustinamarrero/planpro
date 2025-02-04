import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plantelpro/app/bloc/app_bloc.dart';
import 'package:plantelpro/login/login.dart';
import 'package:plantelpro_ui/plantelpro_ui.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginView();
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final userType = context.select((LoginBloc bloc) => bloc.state.userType);
    return Scaffold(
      appBar: const PLANPROAppBar(
        textTitle: 'Registro',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(PLANPROSpacing.spaceUnit),
              child: PLANPROSwitch(
                options: [
                  AppUserType.player.displayName,
                  AppUserType.coach.displayName,
                ],
                onChanged: (value) {
                  context.read<LoginBloc>().add(
                        LoginSwitchAppTypeChanged(
                          appUserType: AppUserType.values[value],
                        ),
                      );
                },
              ),
            ),
            if (userType.isPlayer) const _PlayerView() else const _CoachView(),
          ],
        ),
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
          onChanged: (value) {
            context.read<LoginBloc>().add(
                  LoginFieldChanged(fieldName: 'name', value: value),
                );
          },
        ),
        PLANPROTextField(
          hintText: 'Email',
          onChanged: (value) {
            context.read<LoginBloc>().add(
                  LoginFieldChanged(fieldName: 'email', value: value),
                );
          },
        ),
        PLANPROTextField(
          hintText: 'Contraseña',
          onChanged: (value) {
            context.read<LoginBloc>().add(
                  LoginFieldChanged(fieldName: 'password', value: value),
                );
          },
        ),
        PLANPROTextField(
          hintText: 'Celular',
          onChanged: (value) {
            context.read<LoginBloc>().add(
                  LoginFieldChanged(fieldName: 'phone', value: value),
                );
          },
        ),
        PLANPRODropdown(
          options: TypeOfPlayer.values.map((e) => e.displayName).toList(),
          onChanged: (value) {
            context.read<LoginBloc>().add(
                  LoginFieldChanged(fieldName: 'position', value: value ?? ''),
                );
          },
        ),
        Row(
          children: [
            Expanded(
              child: PLANPROTextField(
                hintText: 'Altura',
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  context.read<LoginBloc>().add(
                        LoginFieldChanged(fieldName: 'altura', value: value),
                      );
                },
              ),
            ),
            Expanded(
              child: PLANPROTextField(
                hintText: 'Peso',
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  context.read<LoginBloc>().add(
                        LoginFieldChanged(fieldName: 'peso', value: value),
                      );
                },
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

class _CoachView extends StatelessWidget {
  const _CoachView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PLANPROTextField(
          hintText: 'Nombre',
          onChanged: (value) {
            context.read<LoginBloc>().add(
                  LoginFieldChanged(fieldName: 'name', value: value),
                );
          },
        ),
        PLANPROTextField(
          hintText: 'Email',
          onChanged: (value) {
            context.read<LoginBloc>().add(
                  LoginFieldChanged(fieldName: 'email', value: value),
                );
          },
        ),
        PLANPROTextField(
          hintText: 'Contraseña',
          obscureText: true,
          onChanged: (value) {
            context.read<LoginBloc>().add(
                  LoginFieldChanged(fieldName: 'password', value: value),
                );
          },
        ),
        PLANPROTextField(
          hintText: 'Celular',
          keyboardType: TextInputType.phone,
          onChanged: (value) {
            context.read<LoginBloc>().add(
                  LoginFieldChanged(fieldName: 'phone', value: value),
                );
          },
        ),
        PLANPROTextField(
          hintText: 'Cuadro',
          onChanged: (value) {
            context.read<LoginBloc>().add(
                  LoginFieldChanged(fieldName: 'cuadro', value: value),
                );
          },
        ),
        PLANPROTextField(
          hintText: 'Liga',
          onChanged: (value) {
            context.read<LoginBloc>().add(
                  LoginFieldChanged(fieldName: 'liga', value: value),
                );
          },
        ),
        const SizedBox(
          height: PLANPROSpacing.spaceUnit,
        ),
        Center(
          child: PLANPROOutlinedButton.primary(
            text: 'Aceptar',
            onPressed: () {
              context.push('/coach');
            },
          ),
        ),
      ],
    );
  }
}
