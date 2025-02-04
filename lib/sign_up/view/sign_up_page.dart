import 'package:flutter/material.dart';
import 'package:plantelpro_ui/plantelpro_ui.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PLANPROAppBar.bigAppBar(
        textTitle: 'Registro',
        widgetTitle: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'PLANTEL',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: PLANPROColors.white,
                    ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'PRO',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: PLANPROColors.white,
                        ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.settings,
                    size: 36,
                    color: PLANPROColors.primaryGreen,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: PLANPROSpacing.spaceUnit),
            Padding(
              padding: const EdgeInsets.all(PLANPROSpacing.spaceUnit),
              child: Text(
                'Ingresar',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: PLANPROColors.black,
                    ),
              ),
            ),
            const SizedBox(height: PLANPROSpacing.spaceUnit),
            PLANPROTextField(
              hintText: 'email',
              prefix: const Icon(
                Icons.email_outlined,
                color: PLANPROColors.lightGrey,
              ),
              onChanged: (value) {},
            ),
            const SizedBox(height: PLANPROSpacing.spaceUnit),
            PLANPROTextField(
              hintText: 'password',
              prefix: const Icon(
                Icons.lock_outline,
                color: PLANPROColors.lightGrey,
              ),
              obscureText: true,
              onChanged: (value) {},
            ),
            const SizedBox(height: PLANPROSpacing.spaceUnit * 2),
            Center(
              child: PLANPROOutlinedButton.primary(
                text: 'ingresar',
                onPressed: () {},
              ),
            ),
            const SizedBox(height: PLANPROSpacing.spaceUnit * 2),
          ],
        ),
      ),
    );
  }
}
