// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/* Textfield generico, el cual en base al tipo de su TextInputType raelizara
  validaciones, de igual forma para compartir tanto diseño como funcionalidades */
class TaskTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool isRequired;
  final String hintText;
  final TextInputType inputType;
  final int? maxLines;
  // final
  const TaskTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.isRequired,
    this.hintText = 'Escribe aquí',
    required this.inputType,
    this.maxLines,
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
          TextFormField(
            // Estas lineas permiten que el textfield siga corriendo al llegar
            // al final y no se modifique el height del mismo
            maxLines: 1, 
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
            ),
            inputFormatters: inputType == TextInputType.datetime
                ? [
                    // Limite de un string fecha
                    LengthLimitingTextInputFormatter(10),
                    // Solamente digitos y se puede escribir despues de un '-'
                    FilteringTextInputFormatter.allow(RegExp(r'^[0-9\-]*$')),
                    TextInputFormatter.withFunction((oldValue, newValue) {
                      String text = newValue.text;
                      // Primero dejamos que escriba 4 numeros
                      if (newValue.text.length == 4 &&
                          oldValue.text.length != 5) {
                        text += '-';
                      }
                      // Despues de que haya escrito los 4 se agrega el signo y luego dejamos solo 2 mas
                      if (newValue.text.length == 7 &&
                          oldValue.text.length != 8) {
                        text += '-';
                      }
                      return TextEditingValue(text: text);
                    })
                  ]
                : null,
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
        ],
      ),
    );
  }
}
