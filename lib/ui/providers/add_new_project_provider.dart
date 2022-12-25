import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addNewProjectTitleProvider = Provider.autoDispose((ref) {
  return TextEditingController();
});
