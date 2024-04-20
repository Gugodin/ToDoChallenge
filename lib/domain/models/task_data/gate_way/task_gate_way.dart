
import '../task_data.dart';

/* El GateWay es para abstraer los casos de uso que queremos realizar con las peticiones
  en una API se encargará de implementar estas funciones (Ver: `infraestrucutre/apis/task_api/task_api.dart`)*/
abstract class TaskGateWay {
  Future<List<TaskModel>> getAllTaks();
  Future<TaskModel> getTaskById(int id);
  Future<void> createTask(TaskModel taskToCreate);
  Future<void> updateTask(TaskModel taskToCreate);
  Future<void> deleteTask(int id);
}
