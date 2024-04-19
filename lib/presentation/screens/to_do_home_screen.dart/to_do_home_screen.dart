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
      resizeToAvoidBottomInset: false,
      body: const Column(
        children: [
          Expanded(flex: 2, child: HeaderSection()),
          Expanded(flex: 5, child: TaskListSection()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Realizando peticion');
          showBottomModalTask(
              context,
              IsEditingTaks(
                  id: 10,
                  titleTask: 'Tarea edicion',
                  isCompleted: true,
                  comments: 'Comentario edicion',
                  description: 'Descripcion edicion',
                  dueDate: '2222-22-22',
                  tags: 'tags'));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
