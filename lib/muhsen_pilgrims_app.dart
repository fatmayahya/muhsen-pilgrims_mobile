import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/router/app_router.dart';
import 'core/themes/app_theme.dart';
import 'features/splash/presentation/bloc/splash_bloc.dart';

class MuhsenPilgrimsApp extends StatelessWidget {
  const MuhsenPilgrimsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashBloc(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,

        // 🌍 Localization
        locale: const Locale('ar'),
        supportedLocales: const [
          Locale('ar'),
        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],

        theme: appTheme(),
        routerConfig: appRouter,
      ),
    );
  }
}
