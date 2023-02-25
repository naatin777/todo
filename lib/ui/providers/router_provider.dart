import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/ui/pages/detail/detail.dart';
import 'package:todo/ui/pages/home/home.dart';

final routerProvider = Provider((ref) {
  return GoRouter(
    routes: [
      GoRoute(
        path: "/",
        pageBuilder: (context, state) {
          return MaterialPage(
            key: state.pageKey,
            child: const Home(),
          );
        },
      ),
      GoRoute(
        path: "/detail/:id",
        pageBuilder: (context, state) {
          return MaterialPage(
            key: state.pageKey,
            child: Detail(
              id: state.params["id"],
            ),
          );
        },
      ),
    ],
  );
});
