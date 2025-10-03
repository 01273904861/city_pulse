import 'package:city_pulse/core/consts/app_colors.dart';
import 'package:city_pulse/core/consts/app_const.dart';
import 'package:city_pulse/features/on%20boarding/widgets/custom_icon.dart';
import 'package:flutter/material.dart';

class WhatWeTrackWidget extends StatelessWidget {
  const WhatWeTrackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 180),
        Text(
          "What We Track",
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 90),
        SizedBox(
          width: 300,
          height: 70,
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(width: 20),
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, i) {
              return CustomListviewImage(imageModel: AppConst.imageModels[i]);
            },
          ),
        ),
        SizedBox(height: 50),

        Text(
          textAlign: TextAlign.center,
          "We bring together data on our\nenviroment, well-being,and\nsocial life to create a\nliving picture of our city ",
          style: TextStyle(color: Colors.white70, fontSize: 18),
        ),
      ],
    );
  }
}
