import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filter_task_provider.g.dart';

enum FilterType { all, done, undone }
// Provider que manejara los filtros del home
@riverpod
class TaskFilter extends _$TaskFilter {
  @override
  FilterType build() {
    return FilterType.all;
  }

  void setFilterType(FilterType newFilter) {
    state = newFilter;
  }
}
