import 'package:city_pulse/core/consts/app_colors.dart';
import 'package:flutter/material.dart';

class TodayMessage extends StatelessWidget {
  final int aqi;

  const TodayMessage({super.key, required this.aqi});

  String _getMessage() {
    if (aqi <= 50) {
      return "The air is clear today 🌱 Take a deep breath.";
    } else if (aqi <= 100) {
      return "Air quality is acceptable 🙂 Stay active.";
    } else if (aqi <= 150) {
      return "Air quality is moderate 😐 Limit outdoor activity.";
    } else if (aqi <= 200) {
      return "Unhealthy air 🚫 Consider wearing a mask.";
    } else {
      return "Very unhealthy ⚠️ Stay indoors and stay safe.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // ياخد كل عرض الشاشة
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.lightBlack,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Today's Message",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _getMessage(),
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
