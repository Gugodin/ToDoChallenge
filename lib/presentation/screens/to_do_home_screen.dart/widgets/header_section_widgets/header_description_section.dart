import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/presentation/providers/providers.dart';

/* Esta parte es algo importante ya que tiene que ver con la funcionalidad
  del filtro, sirve para mostrar al usuario la cantidad de tareas que le 
  hace falta hacer y las ya hechas */
class HeaderDescriptionSection extends ConsumerWidget {
  const HeaderDescriptionSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final taskList = ref.watch(taskProvider);
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, bottom: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bienvenido de vuelta 👋',
            style: theme.textTheme.labelMedium!.copyWith(fontSize: 20),
          ),
          Text(
            '¿Que haremos hoy?',
            style: theme.textTheme.labelSmall!.copyWith(color: Colors.white),
          ),
          _ContainerDescription(
            theme: theme,
            title: 'Tareas por hacer: ',
            value: taskList.when(
              // Sirve que para cuando el provier haga un refresh, este no se quede
              // con la data anterior y ejecute el estado loading
              skipLoadingOnRefresh: false,
              /*Obtenemos el numero de tareas no realizadas, en base
              a la lista de tareas que obtenemos de la API */
              data: (data) => Text(data
                  .where((element) => !element.isComplete)
                  .toList()
                  .length
                  .toString()),
              error: (error, stackTrace) => Icon(Icons.error),
              loading: () => const SizedBox(
                  width: 10,
                  height: 10,
                  child: CircularProgressIndicator(
                    strokeWidth: 1,
                  )),
            ),
            filter: FilterType.undone,
          ),
          _ContainerDescription(
            theme: theme,
            title: 'Tareas hechas: ',
            value: taskList.when(
              // Sirve que para cuando el provier haga un refresh, este no se quede
              // con la data anterior y ejecute el estado loading
              skipLoadingOnRefresh: false,
              /*Obtenemos el numero de tareas realizadas, en base
              a la lista de tareas que obtenemos de la API */
              data: (data) => Text(data
                  .where((element) => element.isComplete)
                  .toList()
                  .length
                  .toString()),
              error: (error, stackTrace) => Icon(Icons.error),
              loading: () => const SizedBox(
                  width: 10,
                  height: 10,
                  child: CircularProgressIndicator(
                    strokeWidth: 1,
                  )),
            ),
            filter: FilterType.done,
          ),
        ],
      ),
    );
  }
}

// Un contenedor generico el cual realiza las funciones de filtrado
class _ContainerDescription extends ConsumerWidget {
  final String title;
  final Widget value;
  final FilterType filter;
  const _ContainerDescription({
    required this.filter,
    required this.theme,
    required this.title,
    required this.value,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context, ref) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: size.width * 0.4,
      decoration: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(10)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            ref.read(taskFilterProvider.notifier).setFilterType(filter);
          },
          borderRadius: BorderRadius.circular(10.0),
          splashColor: Colors.grey[500],
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                value
              ],
            ),
          ),
        ),
      ),
    );
  }
}
