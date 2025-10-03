import 'package:city_pulse/features/on%20boarding/models/icon_model.dart';
import 'package:flutter/material.dart';

class CustomListviewImage extends StatelessWidget {
  const CustomListviewImage({super.key, required this.imageModel});
  final ImageModel imageModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),

      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: imageModel.color,
      ),
      child: Image.asset(
        fit: BoxFit.scaleDown,
        imageModel.image,
        width: 70,
        height: 50,
      ),
    );
  }
}
