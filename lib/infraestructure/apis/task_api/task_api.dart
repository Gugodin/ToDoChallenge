import 'package:todoapp/domain/domain.dart';
import 'package:todoapp/infraestructure/infraestructure.dart';
import 'package:http/http.dart' as http;

import '../../../config/config.dart';

class TaskApi implements TaskGateWay {
  final communHeaders = {
    'Content-Type': 'application/x-www-form-urlencoded',
    'Authorization':
        'Bearer e864a0c9eda63181d7d65bc73e61e3dc6b74ef9b82f7049f1fc7d9fc8f29706025bd271d1ee1822b15d654a84e1a0997b973a46f923cc9977b3fcbb064179ecd',
  };

  final String token = 'javier_new';

  @override
  Future<List<TaskModel>> getAllTaks() async {
  
    ReturnHttp resp = await HttpHelper.get(
        url: TASK_URL,
        body: {'token': token},
        headers: Headers(
          replaceHeaders: true,
          headersData: communHeaders,
        ));
    return List<TaskModel>.generate((resp.data as List).length, (index) => TaskModel.fromMap((resp.data as List)[index]));
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
          headersData: communHeaders,
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
