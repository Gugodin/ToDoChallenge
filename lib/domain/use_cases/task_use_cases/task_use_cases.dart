import 'package:todoapp/domain/domain.dart';

class TaskUseCases {
  TaskGateWay taskGateWay;

  TaskUseCases({
    required this.taskGateWay,
  });
  /* Esta clase esta pensada para que algun provider la utilice y en el 
  constructor se utilice una API la cual implemente el GateWay definido */
  Future<List<TaskModel>> getAllTaks() => taskGateWay.getAllTaks();
  Future<TaskModel> getTaskById(int id) => taskGateWay.getTaskById(id);
  Future<void> createTask(TaskModel taskToCreate) => taskGateWay.createTask(taskToCreate);
  Future<void> updateTask(TaskModel taskToCreate) => taskGateWay.updateTask(taskToCreate);
  Future<void> deleteTask(int id) => taskGateWay.deleteTask(id);

}
