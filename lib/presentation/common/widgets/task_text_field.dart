// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
          Text(
            '$label${isRequired ? ' *' : ''}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            maxLines: 1,
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
            ),
            inputFormatters: inputType == TextInputType.datetime
                ? [
                    LengthLimitingTextInputFormatter(10),
                    FilteringTextInputFormatter.allow(RegExp(r'^[0-9\/]*$')),
                    TextInputFormatter.withFunction((oldValue, newValue) {
                      String text = newValue.text;
                      if (newValue.text.length == 4 &&
                          oldValue.text.length != 5) {
                        text += '/';
                      }
                      if (newValue.text.length == 7 &&
                          oldValue.text.length != 8) {
                        text += '/';
                      }
                      return TextEditingValue(text: text);
                    })
                  ]
                : null,
            validator: (value) {
              if (!isRequired) return null;
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
