import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todoapp/domain/domain.dart';

part 'task_provider.g.dart';

@riverpod
class Task extends _$Task {
  @override
  List<TaskModel> build() {
    return [
      TaskModel(
          id: 10,
          title: 'Primera tarea',
          isComplete: true,
          description:
              'Tengo que terminar tareasaasdas dasdadaddasasa sddasadsasadsa asda asdad asdasdad ',
          dueDate: DateTime.now()),
      TaskModel(
          id: 10,
          title: 'Segunda tarea',
          isComplete: false,
          dueDate: DateTime.now()),
      TaskModel(
        id: 10,
        title: 'Tercera tarea',
        isComplete: true,
        description:
            'Tengo que terminar tareasaasdas dasdadaddasasa sddasadsasadsa asda asdad asdasdad ',
      )
    ];
  }
}
