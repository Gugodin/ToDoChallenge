import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage() 
class ToDoHomeScreen extends StatelessWidget {
  const ToDoHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Hola mundo'),
    );
  }
}