import 'package:city_pulse/features/heart%20beat/models/gridview_card_model.dart';
import 'package:flutter/material.dart';

class GridViewCard extends StatelessWidget {
  const GridViewCard({super.key, required this.gridviewCardModel});
  final GridviewCardModel gridviewCardModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: gridviewCardModel.cardColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(gridviewCardModel.iconData, size: 14),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                gridviewCardModel.title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                gridviewCardModel.subtitle,
                style: TextStyle(fontSize: 12),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
