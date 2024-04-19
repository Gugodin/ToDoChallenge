import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import '../config/config.dart';

class AppProyect extends StatelessWidget {
  AppProyect({super.key});
  final appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'ToDoProyect',
      theme: themeData,
      builder: BotToastInit(),
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.config(),
    );
  }
}
