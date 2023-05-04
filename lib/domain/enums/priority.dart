import 'package:flutter/material.dart';

enum Priority {
  critical(Colors.red),
  high(Colors.yellow),
  medium(Colors.blue),
  low(Colors.grey);

  final Color color;

  const Priority(this.color);
}
