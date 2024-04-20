import '../../../config/config.dart';
import '../../../domain/models/task_data/task_data.dart';
import '../../helpers/helpers.dart';

class TaskApi implements TaskGateWay {


  // Funcion para actualizar una task por id
  @override
  Future<List<TaskModel>> getAllTaks() async {
    ReturnHttp resp = await HttpHelper.get(
        url: TASK_URL,
        body: {'token': TOKEN},
        headers: Headers(
          replaceHeaders: true,
          headersData: COMMON_HEADERS,
        ));
    return List<TaskModel>.generate((resp.data as List).length,
        (index) => TaskModel.fromMap((resp.data as List)[index]));
  }
  // Funcion para crear una task
  @override
  Future<TaskModel> getTaskById(int id) async {
    ReturnHttp resp = await HttpHelper.get(
        url: '$TASK_URL/$id',
        body: {'token': TOKEN},
        headers: Headers(
          replaceHeaders: true,
          headersData: COMMON_HEADERS,
        ));
    return TaskModel.fromMap((resp.data as List).first);
  }
  // Funcion para crear una task
  @override
  Future<void> createTask(TaskModel taskToCreate) async {
    ReturnHttp resp = await HttpHelper.post(
        url: TASK_URL,
        body: taskToCreate.toMap(),
        headers: Headers(
          replaceHeaders: true,
          headersData: COMMON_HEADERS,
        ));
    if (resp.error == null) {
      NotificationHelper.instance.createTaskNoti();
    }
  }
  // Funcion para actualizar una task por id
  @override
  Future<void> updateTask(TaskModel taskToCreate) async {
    ReturnHttp resp = await HttpHelper.put(
        url: '$TASK_URL/${taskToCreate.id}',
        body: taskToCreate.toMap(),
        headers: Headers(
          replaceHeaders: true,
          headersData: COMMON_HEADERS,
        ));
    if (resp.error == null) {
      NotificationHelper.instance.updateTaskNoti();
    }
  }
  // Funcion para eliminar una task por id
  @override
  Future<void> deleteTask(int id) async {
    ReturnHttp resp = await HttpHelper.delete(
        url: '$TASK_URL/$id',
        body: {'token': TOKEN},
        headers: Headers(
          replaceHeaders: true,
          headersData: COMMON_HEADERS,
        ));
    if (resp.error == null) {
      NotificationHelper.instance.deleteTaskNoti();
    }
  }
}
