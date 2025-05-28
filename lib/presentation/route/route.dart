import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/presentation/notifiers/router.dart';
import 'package:todo/presentation/pages/detail/detail.dart';
import 'package:todo/presentation/pages/home/home.dart';
import 'package:todo/presentation/route/home_route.dart';

part 'route.g.dart';

@TypedStatefulShellRoute<HomeRouteData>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<TasksBranch>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<TasksRouteData>(path: "/tasks", name: "tasks"),
      ],
    ),
    TypedStatefulShellBranch<UpcomingBranch>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<UpcomingRouteData>(path: "/upcoming", name: "upcoming"),
      ],
    ),
    TypedStatefulShellBranch<AnalyticsBranch>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<AnalyticsRouteData>(path: "/analytics", name: "analytics"),
      ],
    ),
    TypedStatefulShellBranch<SettingsBranch>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<SettingsRouteData>(path: "/settings", name: "settings"),
      ],
    ),
  ],
)
class HomeRouteData extends StatefulShellRouteData {
  const HomeRouteData();

  static final GlobalKey<NavigatorState> $navigatorKey = rootNavigatorKey;

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return navigationShell;
  }

  static const String $restorationScopeId = 'restorationScopeId';

  static Widget $navigatorContainerBuilder(
    BuildContext context,
    StatefulNavigationShell navigationShell,
    List<Widget> children,
  ) {
    return Home(navigationShell: navigationShell, id: "", children: children);
  }
}

@TypedGoRoute<DetailRoute>(path: "/tasks/:id", name: "detail")
class DetailRoute extends GoRouteData {
  const DetailRoute(this.id);

  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Detail(id: id);
  }

  @override
  CustomTransitionPage<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      name: state.name,
      arguments: <String, String>{
        ...state.pathParameters,
        ...state.uri.queryParameters,
      },
      child: build(context, state),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}
