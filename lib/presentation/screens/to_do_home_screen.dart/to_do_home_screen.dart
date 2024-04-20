import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/modals/modals.dart';
import 'widgets/widgets.dart';

@RoutePage()
class ToDoHomeScreen extends ConsumerWidget {
  const ToDoHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      /* Este parametro es importante, debido a que cuando el teclado surge desde
        debajo del dispositivo si se queda en `true` este nos desplaza todo el body */
      resizeToAvoidBottomInset: false,
      body: const Column(
        children: [
          Expanded(flex: 2, child: HeaderSection()),
          Expanded(flex: 5, child: TaskListSection()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Se muestra el modal para crear una tarea
          showBottomModalTask(context);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
