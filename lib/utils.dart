import 'package:flutter/material.dart';

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

TextStyle TextStyleTitle() {
  return const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 15,
    color: Colors.black,
  );
}

TextStyle TextStyleBody() {
  return const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 12,
    color: Colors.black,
  );
}
