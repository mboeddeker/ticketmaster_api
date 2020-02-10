import 'package:flutter/material.dart';
import 'package:ticketmaster/styles/colors.dart';

class AppTextStyles {
  static TextStyle appBarHeader = TextStyle(
    color: AppColors.lightBackground,
    fontWeight: FontWeight.w700,
    fontSize: 48,
    shadows: AppColors.lightShadows(2),
  );

  static TextStyle itemName = TextStyle(fontWeight: FontWeight.w600, fontSize: 24);
}
