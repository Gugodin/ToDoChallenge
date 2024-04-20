import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../infraestructure/apis/apis.dart';
import '../../../domain/domain.dart';
import '../providers.dart';

part 'task_provider.g.dart';

// Provider que nos proporcionará las peticiones de la API
@riverpod
TaskUseCases taskUseCases(TaskUseCasesRef ref) {
  return TaskUseCases(taskGateWay: TaskApi());
}

// Provider que se encargara de obtener el listado de tareaas
@riverpod
class Task extends _$Task {
  @override
  FutureOr<List<TaskModel>> build() {
    return ref.read(taskUseCasesProvider).getAllTaks();
  }
}
//  Provier que se encargara de filtrar el listado en base al filtro seleccionado
@riverpod
List<TaskModel> filteredTask(FilteredTaskRef ref) {
  final currentFilter = ref.watch(taskFilterProvider);
  final currentTask = ref.watch(taskProvider).asData?.value ?? [];
  switch (currentFilter) {
    case FilterType.done:
      return currentTask.where((element) => element.isComplete).toList();
    case FilterType.undone:
      return currentTask.where((element) => !element.isComplete).toList();
    default:
      return currentTask;
  }
}
