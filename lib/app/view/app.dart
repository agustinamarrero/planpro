import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plantelpro/coach/add_player/view/add_player_page.dart';
import 'package:plantelpro/coach/coach.dart';
import 'package:plantelpro/coach/my_player/view/my_player_page.dart';
import 'package:plantelpro/coach/player_assistance/view/player_assistance_page.dart';
import 'package:plantelpro/coach/upload_videos/view/upload_videos_page.dart';
import 'package:plantelpro/l10n/l10n.dart';
import 'package:plantelpro/login/login.dart';
import 'package:plantelpro/main/main.dart';
import 'package:plantelpro/packages/auth_repository/auth_repository.dart';
import 'package:plantelpro/player/player.dart';
import 'package:plantelpro/sign_up/sign_up.dart';
import 'package:plantelpro_ui/plantelpro_ui.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final planproTheme = PLANPROTheme();

    final authRepository = AuthRepository();

    final router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const MainPage(),
        ),
        ShellRoute(
          builder: (context, state, child) {
            return BlocProvider(
              create: (context) => LoginBloc(
                authRepository: context.read<AuthRepository>(),
              ),
              child: child,
            );
          },
          routes: [
            GoRoute(
              path: '/login',
              builder: (context, state) {
                return const LoginPage();
              },
              routes: [
                GoRoute(
                  path: 'health-data',
                  builder: (context, state) {
                    return const HealthDataPage();
                  },
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: '/sign-up',
          builder: (context, state) => const SignUpPage(),
        ),
        GoRoute(
          path: '/coach',
          builder: (context, state) => const MainCoachPage(),
          routes: [
            GoRoute(
              path: 'team',
              builder: (context, state) => const TeamPage(),
            ),
            GoRoute(
              path: 'upload-videos',
              builder: (context, state) => const UploadVideosPage(),
            ),
            GoRoute(
              path: 'my-player',
              builder: (context, state) => const MyPlayerPage(),
            ),
            GoRoute(
              path: 'add-player',
              builder: (context, state) => const AddPlayerPage(),
            ),
            GoRoute(
              path: 'players-assistance',
              builder: (context, state) => const PlayerAssistancePage(),
            ),
          ],
        ),
        GoRoute(
          path: '/player',
          builder: (context, state) => const PlayerMainPage(),
          routes: [
            GoRoute(
              path: 'survey',
              builder: (context, state) => const SurveyPage(),
            ),
            GoRoute(
              path: 'health-player',
              builder: (context, state) => const HealthPlayerPage(),
            ),
            GoRoute(
              path: 'personal-data',
              builder: (context, state) => const PersonalDataPlayerPage(),
            ),
          ],
        ),
      ],
    );

    return RepositoryProvider(
      create: (context) => authRepository,
      child: MaterialApp.router(
        routerConfig: router,
        theme: planproTheme.lightTheme,
        darkTheme: planproTheme.darkTheme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}
