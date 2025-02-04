import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plantelpro_ui/plantelpro_ui.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PLANPROColors.primaryYellow,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Column(
              children: [
                Text(
                  'PLANTEL',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Roboto',
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'PRO',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: PLANPROColors.primaryGreen,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.settings,
                      size: 48,
                      color: PLANPROColors.primaryGreen,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: PLANPROSpacing.xxxxlg),
            SizedBox(
              width: 200,
              child: PLANPROOutlinedButton.primary(
                text: 'Ingresar',
                onPressed: () {
                  context.push('/sign-up');
                },
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                context.push('/login');
              },
              child: const Text(
                'Registrarse',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: PLANPROColors.primaryGreen,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
