import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/constant.dart';
import 'package:todo/domain/enums/navigation_item.dart';
import 'package:todo/presentation/providers/list_id_provider.dart';
import 'package:todo/presentation/route/route.dart';

final routerProvider = Provider((ref) {
  return GoRouter(
    routes: $appRoutes,
    redirect: (context, state) {
      if (state.location == "/") {
        return "/${NavigationItems.task.name}?listId=${inbox.id}";
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          final listId = state.queryParameters["listId"] ?? inbox.id;
          ref.read(listIdProvider.notifier).changeListId(listId);
        });
        return null;
      }
    },
  );
});
