import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/common.dart';
import '../../../providers/providers.dart';

/* Apartado de la seccion de la lista de tareas (Parte de abajo) */
class TaskListSection extends StatelessWidget {
  const TaskListSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          color: theme.colorScheme.secondary),
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Text(
                'Tareas',
                style: theme.textTheme.labelLarge!
                    .copyWith(fontWeight: FontWeight.w500),
              )),
          const Expanded(flex: 2, child: _SegmentButtonSection()),
          const Expanded(flex: 12, child: _ListTaskSection()),
        ],
      ),
    );
  }
}

class _ListTaskSection extends ConsumerWidget {
  const _ListTaskSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /* Esta parte es importante, escuchamos a los 2 providers debido a que
       el `taskProvider` nos indicará cuando ya se termino de realizarse la
       peticion y el `taskList` se ve rellenado por el provider anterior
       pero este mismo es filtrado por el `filterTaskProvider`
       Ver: presentation/providers/task_provider/task_provider.dart */
    final taskList = ref.watch(filteredTaskProvider);
    final taskPetition = ref.watch(taskProvider);
    return taskPetition.when(
      // Sirve que el refresh se dispare aunque el provider tenga cache
      skipLoadingOnRefresh: false,
      data: (data) {
        // Funcion para que se pongan los que no han sido completados al inicio
        data.sort((a, b) => a.isComplete ? 1 : -1);
        return taskList.isEmpty
            ? const Center(
                child: Text('No tienes tareas.'),
              )
            : ListView.separated(
                clipBehavior: Clip.antiAlias,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return TaskCardWidget(task: taskList[index]);
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                itemCount: taskList.length);
      },
      error: (error, stackTrace) => const Center(
        child: Text('Hubo un error en la petición.'),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class _SegmentButtonSection extends ConsumerWidget {
  const _SegmentButtonSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentFilter = ref.watch(taskFilterProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: SegmentedButton<FilterType>(
        segments: const [
          ButtonSegment(
              value: FilterType.all,
              label: Text(
                'Todas',
                style: TextStyle(color: Colors.white),
              )),
          ButtonSegment(
              value: FilterType.undone,
              label: Text(
                'Sin hacer',
                style: TextStyle(color: Colors.white),
              )),
          ButtonSegment(
              value: FilterType.done,
              label: Text(
                'Hechas',
                style: TextStyle(color: Colors.white),
              )),
        ],
        selected: {currentFilter},
        onSelectionChanged: (p0) {
          // El filtro seleccionado se guarda en el provider
          ref.read(taskFilterProvider.notifier).setFilterType(p0.first);
        },
      ),
    );
  }
}
