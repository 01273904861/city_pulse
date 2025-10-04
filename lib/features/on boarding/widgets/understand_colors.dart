import 'package:city_pulse/core/app_assets.dart';
import 'package:city_pulse/core/consts/app_colors.dart';
import 'package:flutter/material.dart';

class UnderstandColorsScreen extends StatelessWidget {
  const UnderstandColorsScreen({super.key});

  Widget _buildColorCard(
    String imagePath,
    String title,
    String subtitle,
    Color titleColor,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black54,
        //     blurRadius: 4,
        //     offset: const Offset(0, 2),
        //   ),
        // ],
      ),
      child: Row(
        children: [
          Image.asset(imagePath, width: 64, height: 64, fit: BoxFit.cover),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(215, 255, 255, 255),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 60),
          const Text(
            
            textAlign: TextAlign.center,
            "Each color shows your \ncity's health status",
            style: TextStyle(
              height: 1.5,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 10),
          _buildColorCard(
            Assets.imagesReadHeart,
            "Red",
            "High stress + Pollution",
            Colors.red,
          ),
          _buildColorCard(
            Assets.imagesYellowHeart,
            "Yellow",
            "Moderate health",
            Colors.orange,
          ),
          _buildColorCard(
            Assets.imagesGreenHeart,
            "Green",
            "Clean air + Green spaces",
            Colors.green,
          ),
          _buildColorCard(
            Assets.imagesBlueHeart,
            "Blue",
            "Clean water + Social activity",
            Colors.blue,
          ),
          // const SizedBox(height: 20),
          // const Text(
          //   "Each color shows your city's health status",
          //   style: TextStyle(fontSize: 15, color: Color.fromARGB(213, 255, 255, 255)),
          //   textAlign: TextAlign.center,
          // ),

          // Dots indicator زي اللي تحت
        ],
      ),
    );
  }

  Widget _dot(bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 12 : 8,
      height: isActive ? 12 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.purple : Colors.grey.shade400,
        shape: BoxShape.circle,
      ),
    );
  }
}
