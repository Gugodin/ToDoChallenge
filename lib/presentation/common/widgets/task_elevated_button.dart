// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// Elevated button generico, sin muchos comentarios por dar
class TaskElevatedButton extends StatelessWidget {
  final bool isLoading;
  final String title;
  final Function() onTap;
  final Color? backgrondColor;

  const TaskElevatedButton({
    super.key,
    this.isLoading = false,
    required this.title,
    required this.onTap,
    this.backgrondColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: ElevatedButton(
          onPressed: () {
            onTap();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: backgrondColor,
          ),
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
          )),
    );
  }
}
