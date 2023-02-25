import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final detailTitleProvider = Provider.autoDispose.family(
  (ref, String arg) {
    final titleProvider = TextEditingController(text: arg);
    ref.onDispose(() {
      titleProvider.dispose();
    });
    return titleProvider;
  },
);

final detailDescriptionProvider = Provider.autoDispose.family(
  (ref, String arg) {
    final descriptionProvider = TextEditingController(text: arg);
    ref.onDispose(() {
      descriptionProvider.dispose();
    });
    return descriptionProvider;
  },
);
