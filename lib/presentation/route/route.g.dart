// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$homeRouteData, $detailRoute];

RouteBase get $homeRouteData => StatefulShellRouteData.$route(
  restorationScopeId: HomeRouteData.$restorationScopeId,
  navigatorContainerBuilder: HomeRouteData.$navigatorContainerBuilder,
  factory: $HomeRouteDataExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/tasks',
          name: 'tasks',

          factory: $TasksRouteDataExtension._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/upcoming',
          name: 'upcoming',

          factory: $UpcomingRouteDataExtension._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/analytics',
          name: 'analytics',

          factory: $AnalyticsRouteDataExtension._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/settings',
          name: 'settings',

          factory: $SettingsRouteDataExtension._fromState,
        ),
      ],
    ),
  ],
);

extension $HomeRouteDataExtension on HomeRouteData {
  static HomeRouteData _fromState(GoRouterState state) => const HomeRouteData();
}

extension $TasksRouteDataExtension on TasksRouteData {
  static TasksRouteData _fromState(GoRouterState state) =>
      const TasksRouteData();

  String get location => GoRouteData.$location('/tasks');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $UpcomingRouteDataExtension on UpcomingRouteData {
  static UpcomingRouteData _fromState(GoRouterState state) =>
      const UpcomingRouteData();

  String get location => GoRouteData.$location('/upcoming');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AnalyticsRouteDataExtension on AnalyticsRouteData {
  static AnalyticsRouteData _fromState(GoRouterState state) =>
      const AnalyticsRouteData();

  String get location => GoRouteData.$location('/analytics');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SettingsRouteDataExtension on SettingsRouteData {
  static SettingsRouteData _fromState(GoRouterState state) =>
      const SettingsRouteData();

  String get location => GoRouteData.$location('/settings');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $detailRoute => GoRouteData.$route(
  path: '/tasks/:id',
  name: 'detail',

  factory: $DetailRouteExtension._fromState,
);

extension $DetailRouteExtension on DetailRoute {
  static DetailRoute _fromState(GoRouterState state) =>
      DetailRoute(state.pathParameters['id']!);

  String get location =>
      GoRouteData.$location('/tasks/${Uri.encodeComponent(id)}');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
