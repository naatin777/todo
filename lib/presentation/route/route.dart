import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/presentation/pages/detail/detail.dart';
import 'package:todo/presentation/pages/home/home.dart';

part 'route.g.dart';

@TypedGoRoute<HomeRoute>(
  path: "/:nav",
)
class HomeRoute extends GoRouteData {
  const HomeRoute(this.nav, {required this.id});

  final String nav;
  final String? id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Home(nav: nav, id: id);
  }
}

@TypedGoRoute<DetailsRoute>(
  path: "/details/:id",
)
class DetailsRoute extends GoRouteData {
  const DetailsRoute(this.id);

  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Detail(id: id);
  }
}
