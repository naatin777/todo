import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:morph_todo/constant.dart';
import 'package:morph_todo/presentation/notifiers/task_id_notifier.dart';
import 'package:morph_todo/presentation/notifiers/task_list_id_provider.dart';
import 'package:morph_todo/presentation/pages/error/error.dart';
import 'package:morph_todo/presentation/route/route.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter router(ref) {
  return GoRouter(
    routes: $appRoutes,
    navigatorKey: rootNavigatorKey,
    redirect: (context, state) {
      final location = state.uri.toString();
      debugPrint(location);
      if (location == "/") {
        return "/tasks";
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
    errorPageBuilder: (context, state) {
      return MaterialPage(child: ErrorPage());
    },
  );
}
