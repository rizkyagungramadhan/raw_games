import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  int? fitImageCache(double? size) {
    if (size == null) return null;
    return (MediaQuery.of(this).devicePixelRatio * size).round();
  }
}
