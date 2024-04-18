import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/presentation/providers/providers.dart';

class HeaderDescriptionSection extends ConsumerWidget {
  const HeaderDescriptionSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

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
            title: 'Tareas hechas: ',
            value: '2',
            filter: FilterType.done,
          ),
          _ContainerDescription(
            theme: theme,
            title: 'Tareas por hacer: ',
            value: '1',
            filter: FilterType.undone,
          ),
        ],
      ),
    );
  }
}

class _ContainerDescription extends ConsumerWidget {
  final String title;
  final String value;
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
      margin: EdgeInsets.only(top: 10),
      width: size.width * 0.4,
      // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(value),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
