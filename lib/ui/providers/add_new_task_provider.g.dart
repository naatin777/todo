// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_new_task_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String _$addNewTaskTitleControllerHash() =>
    r'e5f041db30f08aae11f361181e527ae68fcde017';

/// See also [addNewTaskTitleController].
final addNewTaskTitleControllerProvider =
    AutoDisposeProvider<TextEditingController>(
  addNewTaskTitleController,
  name: r'addNewTaskTitleControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addNewTaskTitleControllerHash,
);
typedef AddNewTaskTitleControllerRef
    = AutoDisposeProviderRef<TextEditingController>;
String _$addNewTaskTitleFocusNodeHash() =>
    r'469994a78d3f3a74695219f6036d7aff1d846de2';

/// See also [addNewTaskTitleFocusNode].
final addNewTaskTitleFocusNodeProvider = AutoDisposeProvider<FocusNode>(
  addNewTaskTitleFocusNode,
  name: r'addNewTaskTitleFocusNodeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addNewTaskTitleFocusNodeHash,
);
typedef AddNewTaskTitleFocusNodeRef = AutoDisposeProviderRef<FocusNode>;
String _$addNewTaskDescriptionControllerHash() =>
    r'6e7d2c28866d89afb26618e5624dc157317932d4';

/// See also [addNewTaskDescriptionController].
final addNewTaskDescriptionControllerProvider =
    AutoDisposeProvider<TextEditingController>(
  addNewTaskDescriptionController,
  name: r'addNewTaskDescriptionControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addNewTaskDescriptionControllerHash,
);
typedef AddNewTaskDescriptionControllerRef
    = AutoDisposeProviderRef<TextEditingController>;
String _$addNewTaskDescriptionFocusNodeHash() =>
    r'c00ec13e97162523d9e99e2a186b9792153c6960';

/// See also [addNewTaskDescriptionFocusNode].
final addNewTaskDescriptionFocusNodeProvider = AutoDisposeProvider<FocusNode>(
  addNewTaskDescriptionFocusNode,
  name: r'addNewTaskDescriptionFocusNodeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addNewTaskDescriptionFocusNodeHash,
);
typedef AddNewTaskDescriptionFocusNodeRef = AutoDisposeProviderRef<FocusNode>;
