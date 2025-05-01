import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:morph_todo/constant.dart';
import 'package:morph_todo/domain/enums/navigation_item.dart';
import 'package:morph_todo/presentation/notifiers/task_id_notifier.dart';
import 'package:morph_todo/presentation/notifiers/task_list_id_provider.dart';
import 'package:morph_todo/presentation/route/route.dart';

part 'router.g.dart';

@riverpod
GoRouter router(ref) {
  return GoRouter(
    routes: $appRoutes,
    redirect: (context, state) {
      final location = state.uri.toString();
      if (location == "/") {
        return "/${NavigationItems.task.name}?id=${inbox.id}";
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (location.contains("/detail/")) {
            final taskId = location.replaceAll("/detail/", "");
            ref.read(taskIdNotifierProvider.notifier).changeTaskId(taskId);
          } else {
            final listId = state.uri.queryParameters["id"] ?? inbox.id;
            ref.read(taskListIdProvider.notifier).changeListId(listId);
          }
        });
        return null;
      }
    },
  );
}
