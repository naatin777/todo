import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/presentation/route/route.dart';

final routerProvider = Provider((ref) {
  return GoRouter(
    routes: $appRoutes,
    redirect: (context, state) {
      if (state.location == "/") return "/task";
      return null;
    },
  );
});
