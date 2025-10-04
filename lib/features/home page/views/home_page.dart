import 'package:city_pulse/core/consts/app_colors.dart';
import 'package:city_pulse/core/routing/routes.dart';
import 'package:city_pulse/features/home%20page/views/open_link_screen.dart';
import 'package:city_pulse/features/home%20page/widgets/build_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _openCityPulse(BuildContext context) {
    Navigator.pushNamed(context, Routes.onBoarding);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Choose Your Role",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            buildCard(
              icon: Icons.location_city,
              title: "Urban Planners",
              subtitle: "Explore the City Pulse app",
              onTap: () => _openCityPulse(context),
            ),
            buildCard(
              icon: Icons.people,
              title: "People",
              subtitle: "Visit Stricks official website",
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.game,
                  arguments: URLTitle(
                    title: 'website',
                    url: 'https://khalednasr56.github.io/NasaProject/#/',
                  ),
                );
              },
            ),
            buildCard(
              icon: Icons.videogame_asset,
              title: "Youth (8–18)",
              subtitle: "Play the interactive game",
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.game,
                  arguments: URLTitle(
                    title: 'game',
                    url:
                        'https://www.figma.com/make/vbcD6zOoilsDrjE4utWWAo/City-Mayor-Interactive-Game--Community-?node-id=0-1&t=w4U6z4eAvtU9Sugc-1',
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// City Pulse screen placeholder

// WebView screen
