import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/presentation/pages/home/analytics/analytics_screen.dart';
import 'package:todo/presentation/pages/home/settings/settings_screen.dart';
import 'package:todo/presentation/pages/home/tasks/tasks_screen.dart';
import 'package:todo/presentation/pages/home/upcoming/upcoming_screen.dart';

class TasksBranch extends StatefulShellBranchData {
  const TasksBranch();
}

class TasksRouteData extends GoRouteData {
  const TasksRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return TasksScreen();
  }
}

class UpcomingBranch extends StatefulShellBranchData {
  const UpcomingBranch();
}

class UpcomingRouteData extends GoRouteData {
  const UpcomingRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const UpcomingScreen();
  }
}

class AnalyticsBranch extends StatefulShellBranchData {
  const AnalyticsBranch();
}

class AnalyticsRouteData extends GoRouteData {
  const AnalyticsRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AnalyticsScreen();
  }
}

class SettingsBranch extends StatefulShellBranchData {
  const SettingsBranch();
}

class SettingsRouteData extends GoRouteData {
  const SettingsRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SettingsScreen();
  }
}
