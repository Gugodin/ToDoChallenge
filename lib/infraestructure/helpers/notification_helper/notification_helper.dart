import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import '../../../config/config.dart';

class NotificationHelper {
  NotificationHelper._();
  // Usando patron singleton para evitar que se instancien mas de una vez la clase
  static final instance = NotificationHelper._();

  void createTaskNoti() {
    BotToast.showNotification(
      duration: Duration(seconds: 3),
      backgroundColor: ColorsApp.brigthColor,
      leading: (_) => SizedBox(
        height: 60,
        width: 60,
        child: Image.asset(
          AssetsApp.saveTaksAsset,
        ),
      ),
      title: (_) => const Text(
        'Se creó tu tarea correctamente',
        style: TextStyle(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
      ),
      trailing: (cancelFunc) => IconButton(
          onPressed: cancelFunc,
          icon: const Icon(
            Icons.cancel,
            color: Colors.white,
          )),
    );
  }
  void updateTaskNoti() {
    BotToast.showNotification(
      duration: Duration(seconds: 3),
      backgroundColor: ColorsApp.brigthColor,
      leading: (_) => SizedBox(
        height: 60,
        width: 60,
        child: Image.asset(
          AssetsApp.updateTaksAsset,
        ),
      ),
      title: (_) => const Text(
        'Se editó tu tarea correctamente',
        style: TextStyle(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
      ),
      trailing: (cancelFunc) => IconButton(
          onPressed: cancelFunc,
          icon: const Icon(
            Icons.cancel,
            color: Colors.white,
          )),
    );
  }
  void deleteTaskNoti() {
    BotToast.showNotification(
      duration: Duration(seconds: 3),
      backgroundColor: ColorsApp.brigthColor,
      leading: (_) => SizedBox(
        height: 60,
        width: 60,
        child: Image.asset(
          AssetsApp.deleteTaksAsset,
        ),
      ),
      title: (_) => const Text(
        'Se eliminó tu tarea correctamente',
        style: TextStyle(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
      ),
      trailing: (cancelFunc) => IconButton(
          onPressed: cancelFunc,
          icon: const Icon(
            Icons.cancel,
            color: Colors.white,
          )),
    );
  }
  void errorTaskNoti() {
    BotToast.showNotification(
      duration: Duration(seconds: 3),
      backgroundColor: ColorsApp.brigthColor,
      leading: (_) => SizedBox(
        height: 60,
        width: 60,
        child: Image.asset(
          AssetsApp.errorTaksAsset,
        ),
      ),
      title: (_) => const Text(
        'Hubo un error, intentalo mas tarde',
        style: TextStyle(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
      ),
      trailing: (cancelFunc) => IconButton(
          onPressed: cancelFunc,
          icon: const Icon(
            Icons.cancel,
            color: Colors.white,
          )),
    );
  }
}
