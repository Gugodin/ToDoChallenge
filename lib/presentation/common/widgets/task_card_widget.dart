import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/config/colors/colors.dart';

import '../../../domain/domain.dart';
import '../../../infraestructure/helpers/helpers.dart';

class TaskCardWidget extends ConsumerWidget {
  final TaskModel task;
  const TaskCardWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          height: size.height / 9,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: task.isComplete
                  ? ColorsApp.doneCardColor
                  : ColorsApp.unDoneCardColor),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                print('Editar');
              },
              borderRadius: BorderRadius.circular(15.0),
              splashColor: Colors.grey[500],
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Row(
                  children: [
                    Expanded(
                        flex: 4,
                        child: _DescriptionTaskSection(
                          task: task,
                        )),
                    Expanded(
                        flex: 1,
                        child: _IconSection(
                          isDone: task.isComplete,
                          id: task.id!,
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
        _DeleteButtonTask(
          id: task.id!,
        )
      ],
    );
  }
}

class _DeleteButtonTask extends StatelessWidget {
  final int id;
  const _DeleteButtonTask({
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: -15,
        right: -18,
        child: ElevatedButton(
          onPressed: () {
            print('ELIMINAR TASK');
          },
          style: ElevatedButton.styleFrom(
              minimumSize: const Size(30, 30),
              backgroundColor: Colors.white,
              shape: const CircleBorder()),
          child: const Icon(
            Icons.delete,
            color: Colors.black,
            size: 20,
          ),
        ));
  }
}

class _DescriptionTaskSection extends StatelessWidget {
  final TaskModel task;

  const _DescriptionTaskSection({required this.task});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Align(
                      alignment: task.description != null
                          ? Alignment.topLeft
                          : Alignment.centerLeft,
                      child: Text(
                        task.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.labelMedium!.copyWith(
                            decoration: task.isComplete
                                ? TextDecoration.lineThrough
                                : null),
                      ),
                    )),
                task.dueDate != null
                    ? Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          DateHelper.formatDDMMYYYY(task.dueDate!),
                          style: theme.textTheme.labelSmall!.copyWith(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      )
                    : const SizedBox()
              ],
            )),
        task.description != null
            ? Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Descripción: ${task.description!}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.labelSmall!.copyWith(
                        color: Colors.white,
                        fontSize: 12,
                        decoration: task.isComplete
                            ? TextDecoration.lineThrough
                            : null),
                  ),
                ))
            : const SizedBox(),
      ],
    );
  }
}

class _IconSection extends StatelessWidget {
  final bool isDone;
  final int id;
  const _IconSection({required this.isDone, required this.id});

  @override
  Widget build(BuildContext context) {
    return isDone
        ? Center(
            child: IconButton(
              onPressed: () {},
              padding: const EdgeInsets.all(20),
              icon: const Icon(
                Icons.task_alt,
                size: 30,
              ),
            ),
          )
        : Center(
            child: IconButton(
              onPressed: () {},
              padding: const EdgeInsets.all(20),
              icon: const Icon(
                Icons.circle_outlined,
                size: 30,
              ),
            ),
          );
  }
}
