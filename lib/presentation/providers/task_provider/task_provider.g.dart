// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$taskUseCasesHash() => r'f2fd84f31e64cfc0ea838fcc5ca1402b60adb858';

/// See also [taskUseCases].
@ProviderFor(taskUseCases)
final taskUseCasesProvider = AutoDisposeProvider<TaskUseCases>.internal(
  taskUseCases,
  name: r'taskUseCasesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$taskUseCasesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TaskUseCasesRef = AutoDisposeProviderRef<TaskUseCases>;
String _$filteredTaskHash() => r'5627ebf19e61a4ef34aa7213734c251f3fdd969a';

/// See also [filteredTask].
@ProviderFor(filteredTask)
final filteredTaskProvider = AutoDisposeProvider<List<TaskModel>>.internal(
  filteredTask,
  name: r'filteredTaskProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$filteredTaskHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FilteredTaskRef = AutoDisposeProviderRef<List<TaskModel>>;
String _$taskHash() => r'5476047d4052bb91cc7b5f4fadc88041a249a1a7';

/// See also [Task].
@ProviderFor(Task)
final taskProvider =
    AutoDisposeNotifierProvider<Task, List<TaskModel>>.internal(
  Task.new,
  name: r'taskProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$taskHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Task = AutoDisposeNotifier<List<TaskModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
