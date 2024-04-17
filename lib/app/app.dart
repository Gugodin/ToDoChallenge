import 'package:flutter/material.dart';

import '../config/routes/routes.dart';

// class AppProyect extends StatelessWidget {
//    AppProyect({super.key});

//   // final appRouter = AppRouter();
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return MaterialApp.router(
//       title: 'Proyect',
//       theme: themeAppLight,
//       darkTheme: themeAppDark,
//       routerConfig: appRouter.config(),
//     );
//   }
// }

class AppProyect extends StatelessWidget {
  AppProyect({super.key});
  final appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'ToDoProyect',
      // theme: themeAppLight,
      // darkTheme: themeAppDark,
      routerConfig: appRouter.config(),
    );
  }
}