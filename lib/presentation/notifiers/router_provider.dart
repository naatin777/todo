import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/constant.dart';
import 'package:todo/domain/enums/navigation_item.dart';
import 'package:todo/presentation/notifiers/task_id_notifier.dart';
import 'package:todo/presentation/notifiers/task_list_id_provider.dart';
import 'package:todo/presentation/route/route.dart';

final routerProvider = Provider((ref) {
  return GoRouter(
    routes: $appRoutes,
    redirect: (context, state) {
      if (state.location == "/") {
        return "/${NavigationItems.task.name}?id=${inbox.id}";
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (state.location.contains("/detail/")) {
            final taskId = state.location.replaceAll("/detail/", "");
            ref.read(taskIdNotifierProvider.notifier).changeTaskId(taskId);
          } else {
            final listId = state.queryParameters["id"] ?? inbox.id;
            ref.read(taskListIdProvider.notifier).changeListId(listId);
          }
        });
        return null;
      }
    },
  );
});
