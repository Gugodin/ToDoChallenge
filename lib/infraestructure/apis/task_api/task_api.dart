import 'package:todoapp/domain/domain.dart';
import 'package:todoapp/infraestructure/infraestructure.dart';

import '../../../config/config.dart';

class TaskApi implements TaskGateWay {
  @override
  Future<List<TaskModel>> getAllTaks() async {
    // TODO: implement getAllTaks
    throw UnimplementedError();
  }

  @override
  Future<TaskModel> getTaskById(int id) async {
    // TODO: implement getTaskById
    throw UnimplementedError();
  }

  @override
  Future<void> createTask(TaskModel taskToCreate) async {
    ReturnHttp resp = await HttpHelper.post(
        url: TASK_URL,
        body: taskToCreate.toMap(),
        headers: Headers(
          replaceHeaders: true,
          headersData: {
            'Content-Type': 'application/x-www-form-urlencoded',
            'Authorization':
                'Bearer e864a0c9eda63181d7d65bc73e61e3dc6b74ef9b82f7049 f1fc7d9fc8f29706025bd271d1ee1822b15d654a84e1a099 7b973a46f923cc9977b3fcbb064179ecd',
          },
        ));
  }

  @override
  Future<void> updateTask(int id) async {
    // TODO: implement updateTask
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTask(int id) async {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }
}
