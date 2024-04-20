import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/app/app.dart';

void main() {
  /* el ProviderScope es lo que necesita riverpod para poder alojar sus
    providers observables */
  runApp(ProviderScope(child: AppProyect()));
}
