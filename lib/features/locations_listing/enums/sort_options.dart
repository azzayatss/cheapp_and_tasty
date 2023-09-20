import 'package:flutter/material.dart';

enum SortOptions {
  unsorted(
    icon: Icons.clear,
    label: 'Unsorted',
  ),
  byRate(
    icon: Icons.star,
    label: 'Highest rated',
  ),
  byDistance(
    icon: Icons.directions_outlined,
    label: 'Сlosest to you',
  );

  const SortOptions({
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;
}
