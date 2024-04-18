import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/providers.dart';

class TaskListSection extends StatelessWidget {
  const TaskListSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          color: theme.colorScheme.secondary),
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Text(
                'Tareas',
                style: theme.textTheme.labelLarge!
                    .copyWith(fontWeight: FontWeight.w500),
              )),
          const Expanded(flex: 2, child: _SegmentButtonSection()),
          Expanded(
              flex: 12,
              child: Container(
                color: Colors.red,
              )),
        ],
      ),
    );
  }
}

class _SegmentButtonSection extends ConsumerWidget {
  const _SegmentButtonSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentFilter = ref.watch(taskFilterProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: SegmentedButton<FilterType>(
        segments: const [
          ButtonSegment(
              value: FilterType.all,
              label: Text(
                'Todas',
                style: TextStyle(color: Colors.white),
              )),
          ButtonSegment(
              value: FilterType.done,
              label: Text(
                'Hechas',
                style: TextStyle(color: Colors.white),
              )),
          ButtonSegment(
              value: FilterType.undone,
              label: Text(
                'Sin hacer',
                style: TextStyle(color: Colors.white),
              )),
        ],
        selected: {currentFilter},
        onSelectionChanged: (p0) {
          ref.read(taskFilterProvider.notifier).setFilterType(p0.first);
        },
      ),
    );
  }
}
