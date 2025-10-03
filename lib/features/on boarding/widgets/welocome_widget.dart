import 'dart:ffi';

import 'package:city_pulse/core/app_assets.dart';
import 'package:city_pulse/core/consts/app_colors.dart';
import 'package:flutter/material.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 70),

        SizedBox(
          height: 300,
          width: 350,
          child: Image.asset(Assets.imagesHeart, fit: BoxFit.cover),
        ),
        SizedBox(height: 20),
        Text(
          textAlign: TextAlign.center,
          "Welcome to City's\nHeartbeat",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),
        SizedBox(height: 20),
        Text(
          textAlign: TextAlign.center,
          "Feel the pulse of your city\n in real-time",
          style: TextStyle(fontSize: 15, color: Colors.white70),
        ),
      ],
    );
  }
}
