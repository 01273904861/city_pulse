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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(gridviewCardModel.iconData, size: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  gridviewCardModel.title,
                  maxLines: 1,
                  style: TextStyle(
                    
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.clip,
                  ),
                ),
                Text(
                  maxLines: 1,
                  gridviewCardModel.subtitle,
                  style: TextStyle(fontSize: 10),
                  overflow: TextOverflow.clip,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
