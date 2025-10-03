import 'dart:ui';

import 'package:flutter/material.dart';

class GridviewCardModel {
  final IconData iconData;
  final String title;
  final String subtitle;
  final Color cardColor;

  GridviewCardModel({
    required this.iconData,
    required this.title,
    required this.subtitle,
    required this.cardColor,
  });
}
