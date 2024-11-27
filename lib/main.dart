import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/bloc/app_bloc.dart';
import 'data/command/app/bootstrap_commands.dart';
import 'data/command/commands.dart';
import 'screens/home.dart';
import 'screens/onboarding/get_started_screen.dart';
import 'theme.dart';

void main() async {
  await BootstrapCommand().init();

  runApp(
    MultiProvider(
      providers: [
        // App Bloc - handle global app state
        ChangeNotifierProvider.value(value: BaseAppCommand.blocApp),

        // Other Blocs -- test
        ChangeNotifierProvider.value(value: BaseAppCommand.blocOther),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightColorScheme, darkColorScheme) {
        return MaterialApp(
          // navigatorObservers: [],
          debugShowCheckedModeBanner: false,
          title: 'Rise',
          theme: AppTheme.lightTheme(lightColorScheme),
          darkTheme: AppTheme.darkTheme(darkColorScheme),
          home: const _AppBootstrapper(),
        );
      },
    );
  }
}

class _AppBootstrapper extends StatelessWidget {
  const _AppBootstrapper();

  @override
  Widget build(BuildContext context) {
    final isShowOnboarding =
        context.select<AppBloc, bool>((bloc) => bloc.isShowOnboarding);

    /// Show onboarding screen for the first time
    if (isShowOnboarding) const GetStartedScreen();

    return const HomeScreen();
  }
}
