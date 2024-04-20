// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:pattern_formatter/date_formatter.dart';

/* Textfield generico, el cual en base al tipo de su TextInputType raelizara
  validaciones, de igual forma para compartir tanto diseño como funcionalidades */
class TaskTextField extends StatelessWidget {
  TextEditingController controller;
  final String label;
  final bool isRequired;
  final String hintText;
  final TextInputType inputType;
  final int? maxLines;
  final Function(String dateSelected)? onDateSelected;
  // final
  TaskTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.isRequired,
    this.hintText = 'Escribe aquí',
    required this.inputType,
    this.maxLines,
    this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Para demostrar al usuario que es requerido mostramos el *
          Text(
            '$label${isRequired ? ' *' : ''}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          GestureDetector(
            onTap: inputType == TextInputType.datetime
                ? () async {
                    // Si es seleccion de fecha mostramos el datePicker
                    final dateSelected = await showDatePicker(
                        context: context,
                        // Si viene el controller con una fecha, lo mostramos (Mas que nada en las ediciones)
                        currentDate: controller.text.isNotEmpty
                            ? DateTime.parse(controller.text)
                            : null,
                        firstDate:
                            DateTime.now().subtract(const Duration(days: 30)),
                        lastDate: DateTime.now().add(const Duration(days: 30)));
                    if (dateSelected != null) {
                      // Factorizamos el DateTime
                      final dateInString =
                          '${dateSelected.year}-${dateSelected.month.toString().padLeft(2, '0')}-${dateSelected.day.toString().padLeft(2, '0')}';
                      if (onDateSelected != null) {
                        // Lo regresamos en la funcion
                        onDateSelected!(dateInString);
                      }
                    }
                  }
                : null,
            child: TextFormField(
              // Estas lineas permiten que el textfield siga corriendo al llegar
              // al final y no se modifique el height del mismo
              maxLines: 1,
              enabled: !(inputType == TextInputType.datetime),
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
              ),

              validator: (value) {
                if (inputType == TextInputType.datetime) {
                  /* Esta validacion es importante debido a que aunque el dateTime
                    no sea requerido el el validador obligara al usuario a escribir
                    estrictamente la fecha completa y evitar cadenas tipo `1111-`*/
                  if (value!.isNotEmpty && value.length != 10) {
                    return 'Completa el campo';
                  }
                }
                //Si no es requerido no hay que validar
                if (!isRequired) return null;
                // Si es requerido verificar que el textfield no este vacio
                if (value!.isEmpty) return 'Requerido';

                return null;
              },
              controller: controller,
              decoration: InputDecoration(hintText: hintText),
              keyboardType: inputType,
            ),
          ),
        ],
      ),
    );
  }
}
