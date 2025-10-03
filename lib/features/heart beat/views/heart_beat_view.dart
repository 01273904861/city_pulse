import 'package:city_pulse/core/app_assets.dart';
import 'package:city_pulse/core/consts/app_colors.dart';
import 'package:city_pulse/core/functions/get_heart_color.dart';
import 'package:city_pulse/core/routing/routes.dart';
import 'package:city_pulse/features/heart%20beat/models/gridview_card_model.dart';
import 'package:city_pulse/features/heart%20beat/widgets/grid_view_card.dart';
import 'package:city_pulse/features/heart%20beat/widgets/today_message.dart';
import 'package:city_pulse/features/maps/data/models/country_data_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class HeartBeatView extends StatelessWidget {
  const HeartBeatView({super.key, required this.countryDataModel});
  final CountryDataModel countryDataModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.mainColor,
        title: Text(
          "${countryDataModel.city}'s Heartbeat",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        actions: [
          Text(
            DateFormat('EEEE, MMMM, d').format(DateTime.now()),
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          SizedBox(width: 5),
          Icon(Icons.calendar_month, color: Colors.grey, size: 20),
          SizedBox(width: 10),
        ],
      ),
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 300,
                  width: 350,
                  child: Image.asset(
                    getHeartColor(countryDataModel),
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  countryDataModel.resources.healthcare[0].toUpperCase() +
                      countryDataModel.resources.healthcare.substring(1),
                  style: TextStyle(fontSize: 14, color: AppColors.white),
                ),
                SizedBox(height: 20),

                Expanded(
                  child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 7 / 3,
                    ),
                    children: [
                      GridViewCard(
                        gridviewCardModel: GridviewCardModel(
                          iconData: Icons.eco_outlined,
                          title: 'Enviroment',
                          subtitle:
                              'AQI: ${countryDataModel.environment.aqi[0]}, ${countryDataModel.environment.temp[0]}°C',
                          cardColor: AppColors.lightGreen,
                        ),
                      ),
                      GridViewCard(
                        gridviewCardModel: GridviewCardModel(
                          iconData: FontAwesomeIcons.brain,
                          title: 'Social Vibe',
                          subtitle:
                              'connectivityScore: ${countryDataModel.wellbeing.connectivityScore}',
                          cardColor: AppColors.orange,
                        ),
                      ),
                      GridViewCard(
                        gridviewCardModel: GridviewCardModel(
                          iconData: Icons.self_improvement,
                          title: 'Well-being',
                          subtitle:
                              'mood: ${countryDataModel.wellbeing.moodScore},${countryDataModel.wellbeing.socialVibe}',
                          cardColor: AppColors.orange,
                        ),
                      ),
                      GridViewCard(
                        gridviewCardModel: GridviewCardModel(
                          iconData: FontAwesomeIcons.peopleGroup,
                          title: 'Resources',
                          subtitle:
                              'green spaces: ${countryDataModel.resources.greenSpaces}',
                          cardColor: AppColors.lightBlue,
                        ),
                      ),
                    ],
                  ),
                ),
                TodayMessage(aqi: countryDataModel.environment.aqi[0]),
                SizedBox(height: 20),

                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.lightGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      Routes.enviromentalHealth,
                      arguments: countryDataModel,
                    );
                  },
                  label: Text(
                    'More Details',
                    style: TextStyle(color: AppColors.black),
                  ),
                  icon: Icon(Icons.forward, color: AppColors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
