// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../common.dart';

Future<void> showBottomModalTask(BuildContext context,
    [IsEditingTaks? editingData]) async {
  final respModal = showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
    builder: (context) => Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: ModalTask(
        editingData: editingData,
      ),
    ),
  );
}

class ModalTask extends StatefulWidget {
  final IsEditingTaks? editingData;
  const ModalTask({super.key, required this.editingData});

  @override
  State<ModalTask> createState() => _ModalTaskState();
}

class _ModalTaskState extends State<ModalTask> {
  TextEditingController titleController = TextEditingController();
  TextEditingController commentsController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController tagsController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
    // Verificamos si estamos editando, si es asi rellenamos datos
    print('Edit?');
    print(widget.editingData);
    if (widget.editingData != null) {
      print('modificamos');
      titleController =
          TextEditingController(text: widget.editingData!.titleTask);
      commentsController =
          TextEditingController(text: widget.editingData!.comments);
      dateController = TextEditingController(text: widget.editingData!.dueDate);
      tagsController = TextEditingController(text: widget.editingData!.tags);
      descriptionController =
          TextEditingController(text: widget.editingData!.description);
      isCompleted = widget.editingData!.isCompleted;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.60,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Row(
                children: [
                  widget.editingData == null
                      ? const Icon(
                          Icons.task,
                          size: 40,
                        )
                      : const Icon(
                          Icons.edit,
                          size: 40,
                        ),
                  const SizedBox(
                    width: 10,
                  ),
                  widget.editingData == null
                      ? Text(
                          'Crea tu tarea!!',
                          style: Theme.of(context).textTheme.labelMedium,
                        )
                      : Text(
                          'Edita tu tarea!!',
                          style: Theme.of(context).textTheme.labelMedium,
                        )
                ],
              )),
          Expanded(
              flex: 10,
              child: _TextFieldsSection(
                isCompleted: isCompleted,
                titleController: titleController,
                commentsController: commentsController,
                dateController: dateController,
                tagsController: tagsController,
                descriptionController: descriptionController,
                onCompletedCheck: (onCompleted) {
                  setState(() {
                    isCompleted = onCompleted;
                  });
                },
              )),
          Expanded(
              flex: 2,
              child: TaskElevatedButton(
                onTap: () {
                  if (widget.editingData == null) {
                    print('CREAR');
                  } else {
                    print('EDITAR');
                  }
                },
                title: widget.editingData == null ? 'Crear' : 'Editar',
              )),
        ],
      ),
    );
  }
}

class _TextFieldsSection extends StatefulWidget {
  final TextEditingController titleController;
  final TextEditingController commentsController;
  final TextEditingController dateController;
  final TextEditingController tagsController;
  final TextEditingController descriptionController;
  bool isCompleted;
  final Function(bool onCompleted) onCompletedCheck;

  _TextFieldsSection({
    required this.titleController,
    required this.commentsController,
    required this.dateController,
    required this.tagsController,
    required this.descriptionController,
    required this.isCompleted,
    required this.onCompletedCheck,
  });

  @override
  State<_TextFieldsSection> createState() => _TextFieldsSectionState();
}

class _TextFieldsSectionState extends State<_TextFieldsSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TaskTextField(
                        controller: widget.titleController,
                        label: 'Titulo',
                        isRequired: true,
                        inputType: TextInputType.text),
                  ),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '¿Completado?',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              widget.isCompleted = !widget.isCompleted;
                              widget.onCompletedCheck(widget.isCompleted);
                            });
                          },
                          icon: Icon(!widget.isCompleted
                              ? Icons.circle_outlined
                              : Icons.task_alt)),
                    ],
                  )),
                ],
              )),
          Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TaskTextField(
                        controller: widget.commentsController,
                        label: 'Comentarios',
                        isRequired: true,
                        inputType: TextInputType.text),
                  ),
                  Expanded(
                    flex: 1,
                    child: TaskTextField(
                        controller: widget.dateController,
                        label: 'Fecha',
                        hintText: 'YYYY-MM-DD',
                        isRequired: false,
                        inputType: TextInputType.datetime),
                  ),
                ],
              )),
          Expanded(
              flex: 1,
              child: TaskTextField(
                  controller: widget.tagsController,
                  label: 'Tags',
                  isRequired: false,
                  inputType: TextInputType.text)),
          Expanded(
              flex: 1,
              child: TaskTextField(
                  controller: widget.descriptionController,
                  label: 'Descripción',
                  isRequired: false,
                  inputType: TextInputType.text)),
        ],
      ),
    );
  }
}

class IsEditingTaks {
  int id;
  String titleTask;
  bool isCompleted;
  String comments;
  String description;
  String dueDate;
  String tags;
  IsEditingTaks({
    required this.id,
    required this.titleTask,
    required this.isCompleted,
    required this.comments,
    required this.description,
    required this.dueDate,
    required this.tags,
  });

  @override
  String toString() {
    return 'IsEditingTaks(id: $id, titleTask: $titleTask, isCompleted: $isCompleted, comments: $comments, description: $description, dueDate: $dueDate, tags: $tags)';
  }
}
