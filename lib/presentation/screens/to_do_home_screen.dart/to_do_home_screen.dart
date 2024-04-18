import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

@RoutePage()
class ToDoHomeScreen extends StatelessWidget {
  const ToDoHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(flex: 2, child: Container()),
          const Expanded(flex: 5, child: TaskListSection()),
        ],
      ),
    );
  }
}
