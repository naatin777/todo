import 'package:flutter/material.dart';

enum Priority {
  critical(1, Colors.red),
  high(2, Colors.amber),
  medium(3, Colors.blue),
  low(4, null);

  final int number;
  final Color? color;

  const Priority(this.number, this.color);
}
