// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $homeRoute,
      $detailRoute,
    ];

RouteBase get $homeRoute => GoRouteData.$route(
      path: '/:nav',
      name: 'home',
      factory: $HomeRouteExtension._fromState,
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => HomeRoute(
        state.pathParameters['nav']!,
        id: state.uri.queryParameters['id'],
      );

  String get location => GoRouteData.$location(
        '/${Uri.encodeComponent(nav)}',
        queryParams: {
          if (id != null) 'id': id,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $detailRoute => GoRouteData.$route(
      path: '/detail/:id',
      name: 'detail',
      factory: $DetailRouteExtension._fromState,
    );

extension $DetailRouteExtension on DetailRoute {
  static DetailRoute _fromState(GoRouterState state) => DetailRoute(
        state.pathParameters['id']!,
      );

  String get location => GoRouteData.$location(
        '/detail/${Uri.encodeComponent(id)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
