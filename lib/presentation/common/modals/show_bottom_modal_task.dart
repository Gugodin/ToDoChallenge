// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously, unused_result
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:todoapp/domain/domain.dart';

import '../../providers/providers.dart';
import '../common.dart';

/* Utilizamos el mismo modal para crear y editar
  Si se va a editar, tenemos que pasar un objeto IsEditingTaks
  que nos servira para rellenar los campos.
*/
Future<void> showBottomModalTask(BuildContext context,
    [IsEditingTaks? editingData]) async {
  showModalBottomSheet(
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

class ModalTask extends ConsumerStatefulWidget {
  final IsEditingTaks? editingData;
  const ModalTask({super.key, required this.editingData});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ModalTaskState();
}

class _ModalTaskState extends ConsumerState<ModalTask> {
  TextEditingController titleController = TextEditingController();
  TextEditingController commentsController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController tagsController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
    /* Verificamos si el editingData viene con datos para rellenar los textfields y
    el boton de is_completed  */
    if (widget.editingData != null) {
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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Form(
      key: _formKey,
      child: Container(
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
                flex: 12,
                child: _TextFieldsSection(
                  isCompleted: isCompleted,
                  titleController: titleController,
                  commentsController: commentsController,
                  dateController: dateController,
                  tagsController: tagsController,
                  descriptionController: descriptionController,
                  onSelectedDatePicker: (onSelectedDate) {
                    setState(() {
                      dateController =
                          TextEditingController(text: onSelectedDate);
                    });
                  },
                  onCompletedCheck: (onCompleted) {
                    setState(() {
                      isCompleted = onCompleted;
                    });
                  },
                )),
            Expanded(
                flex: 2,
                child: TaskElevatedButton(
                  onTap: () async {
                    // Hacemos la validacion de los textfields
                    if (_formKey.currentState!.validate()) {
                      // Creamos la tarea que se mandara al server
                      TaskModel taksWithData = createTaskModel();
                      if (widget.editingData == null) {
                        await ref
                            .read(taskUseCasesProvider)
                            .createTask(taksWithData);
                        ref.refresh(taskProvider.future);
                        Navigator.pop(context);
                      } else {
                        /* En este caso como estamos editando y ya traemos el id
                          solamente tomamos el task que se edito y con el copyWith 
                          le agregamos el id para mandarlo al servidor*/
                        taksWithData =
                            taksWithData.copyWith(id: widget.editingData!.id);
                        await ref
                            .read(taskUseCasesProvider)
                            .updateTask(taksWithData);
                        ref.refresh(taskProvider.future);
                        Navigator.pop(context);
                      }
                    }
                  },
                  title: widget.editingData == null ? 'Crear' : 'Editar',
                )),
          ],
        ),
      ),
    );
  }

  // Metodo para regresar el task data model que se creará
  TaskModel createTaskModel() {
    return TaskModel(
        title: titleController.text,
        comments: veifyIfStringIsEmpty(commentsController.text),
        description: veifyIfStringIsEmpty(descriptionController.text),
        dueDate: veifyIfStringIsEmpty(dateController.text),
        isComplete: isCompleted,
        tags: veifyIfStringIsEmpty(tagsController.text));
  }

  // Metodo para verificar si un String esta vacio regresar null
  String? veifyIfStringIsEmpty(String strToVerify) {
    if (strToVerify.isEmpty) return null;
    return strToVerify;
  }
}

// ignore: must_be_immutable
class _TextFieldsSection extends StatefulWidget {
  final TextEditingController titleController;
  final TextEditingController commentsController;
  TextEditingController dateController;
  final TextEditingController tagsController;
  final TextEditingController descriptionController;
  bool isCompleted;
  final Function(bool onCompleted) onCompletedCheck;
  final Function(String onSelectedDate) onSelectedDatePicker;

  _TextFieldsSection({
    required this.titleController,
    required this.commentsController,
    required this.dateController,
    required this.tagsController,
    required this.descriptionController,
    required this.isCompleted,
    required this.onCompletedCheck,
    required this.onSelectedDatePicker,
  });

  @override
  State<_TextFieldsSection> createState() => _TextFieldsSectionState();
}

class _TextFieldsSectionState extends State<_TextFieldsSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
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
                        isRequired: false,
                        inputType: TextInputType.text),
                  ),
                  Expanded(
                    flex: 1,
                    child: TaskTextField(
                        controller: widget.dateController,
                        label: 'Fecha',
                        hintText: 'Selecciona fecha',
                        onDateSelected: (dateSelected) {
                          setState(() {
                            widget.dateController =
                                TextEditingController(text: dateSelected);
                            widget.onSelectedDatePicker(dateSelected);
                          });
                        },
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
  String? comments;
  String? description;
  String? dueDate;
  String? tags;
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
