import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/domain/enums/navigation_item.dart';

class NavigationProvider extends StateNotifier<NavigationItem> {
  NavigationProvider() : super(NavigationItem.task);

  void changeNavigation(int index) {
    state = NavigationItem.values[index];
  }
}

final navigationProvider =
    StateNotifierProvider<NavigationProvider, NavigationItem>(
        (ref) => NavigationProvider());
