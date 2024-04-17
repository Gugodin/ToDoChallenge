import 'package:todoapp/domain/domain.dart';

class TaskUseCases {
  TaskGateWay taskGateWay;

  TaskUseCases({
    required this.taskGateWay,
  });

  Future<List<TaskModel>> getAllTaks() => taskGateWay.getAllTaks();
  Future<TaskModel> getTaskById(int id) => taskGateWay.getTaskById(id);
  Future<void> createTask(TaskModel taskToCreate) => taskGateWay.createTask(taskToCreate);
  Future<void> updateTask(int id) => taskGateWay.updateTask(id);
  Future<void> deleteTask(int id) => taskGateWay.deleteTask(id);

}
