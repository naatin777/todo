// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $homeRoute,
      $detailsRoute,
    ];

RouteBase get $homeRoute => GoRouteData.$route(
      path: '/:nav',
      factory: $HomeRouteExtension._fromState,
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => HomeRoute(
        state.pathParameters['nav']!,
        listId: state.queryParameters['list-id'],
      );

  String get location => GoRouteData.$location(
        '/${Uri.encodeComponent(nav)}',
        queryParams: {
          if (listId != null) 'list-id': listId,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

RouteBase get $detailsRoute => GoRouteData.$route(
      path: '/details/:id',
      factory: $DetailsRouteExtension._fromState,
    );

extension $DetailsRouteExtension on DetailsRoute {
  static DetailsRoute _fromState(GoRouterState state) => DetailsRoute(
        state.pathParameters['id']!,
      );

  String get location => GoRouteData.$location(
        '/details/${Uri.encodeComponent(id)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}
