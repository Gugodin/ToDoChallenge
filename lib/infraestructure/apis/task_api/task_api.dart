import 'package:todoapp/domain/domain.dart';

class TaskApi implements TaskGateWay{

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
    // TODO: implement createTask
    throw UnimplementedError();
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