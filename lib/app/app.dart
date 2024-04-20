import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../config/config.dart';

class AppProyect extends StatelessWidget {
  AppProyect({super.key});
  final appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // Agregamos los Locales disponibles
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // Idioma de la aplicación
      supportedLocales: const [
        Locale('es', 'MX'),
      ],
      title: 'ToDoProyect',
      theme: themeData,
      builder: BotToastInit(),
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.config(),
    );
  }
}
