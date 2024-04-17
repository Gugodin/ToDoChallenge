
import '../task_data.dart';

abstract class TaskGateWay {
  Future<List<TaskModel>> getAllTaks();
  Future<TaskModel> getTaskById(int id);
  Future<void> createTask(TaskModel taskToCreate);
  Future<void> updateTask(int id);
  Future<void> deleteTask(int id);
}
