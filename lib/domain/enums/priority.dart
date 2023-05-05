import 'package:flutter/material.dart';

enum Priority {
  critical(1, Colors.red),
  high(2, Colors.yellow),
  medium(3, Colors.blue),
  low(4, Colors.black);

  final int number;
  final Color color;

  const Priority(this.number, this.color);
}
