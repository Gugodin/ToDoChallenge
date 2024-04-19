import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todoapp/presentation/providers/filter_task_provider/filter_task_provider.dart';

import 'package:todoapp/infraestructure/infraestructure.dart';
import 'package:todoapp/domain/domain.dart';

part 'task_provider.g.dart';

@riverpod
TaskUseCases taskUseCases(TaskUseCasesRef ref) {
  return TaskUseCases(taskGateWay: TaskApi());
}

@riverpod
class Task extends _$Task {
  @override
  List<TaskModel> build() {
    List<TaskModel> listTask = [
      TaskModel(
          id: 11,
          title: 'Cuarta tarea',
          isComplete: true,
          description:
              'Tengo que terminar tareasaasdas dasdadaddasasa sddasadsasadsa asda asdad asdasdad ',
          dueDate: DateTime.now()),
      TaskModel(
          id: 12,
          title: 'Primera tarea',
          isComplete: true,
          description:
              'Tengo que terminar tareasaasdas dasdadaddasasa sddasadsasadsa asda asdad asdasdad ',
          dueDate: DateTime.now()),
      TaskModel(
          id: 13,
          title: 'Segunda tarea',
          isComplete: false,
          dueDate: DateTime.now()),
      TaskModel(
        id: 14,
        title: 'Tercera tarea',
        isComplete: true,
        description:
            'Tengo que terminar tareasaasdas dasdadaddasasa sddasadsasadsa asda asdad asdasdad ',
      )
    ];
    listTask.sort((a, b) => a.isComplete ? 1 : -1);
    return listTask;
  }
}

@riverpod
List<TaskModel> filteredTask(FilteredTaskRef ref) {
  final currentFilter = ref.watch(taskFilterProvider);
  final currentTask = ref.watch(taskProvider);

  switch (currentFilter) {
    case FilterType.done:
      return currentTask.where((element) => element.isComplete).toList();
    case FilterType.undone:
      return currentTask.where((element) => !element.isComplete).toList();
    default:
      return currentTask;
  }
}
