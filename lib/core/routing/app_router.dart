import 'package:city_pulse/core/routing/routes.dart';
import 'package:city_pulse/features/enviromental%20health/views/enviromental_health.dart';
import 'package:city_pulse/features/heart%20beat/views/heart_beat_view.dart';
import 'package:city_pulse/features/home%20page/views/open_link_screen.dart';
import 'package:city_pulse/features/home%20page/views/home_page.dart';
import 'package:city_pulse/features/maps/data/models/country_data_model.dart';
import 'package:city_pulse/features/maps/views/location_access_screen.dart';
import 'package:city_pulse/features/maps/views/map_screen.dart';
import 'package:city_pulse/features/on%20boarding/views/on_boarding_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case Routes.locationAccessScreen:
        return MaterialPageRoute(builder: (_) => const LocationAccessScreen());
      case Routes.map:
        return MaterialPageRoute(builder: (_) => const MapPage());

      case Routes.onBoarding:
        return MaterialPageRoute(
          builder: (_) {
            return OnBoardingView();
          },
        );
      case Routes.heartBeat:
        return MaterialPageRoute(
          builder:
              (_) => HeartBeatView(
                countryDataModel: settings.arguments as CountryDataModel,
              ),
        );
      case Routes.enviromentalHealth:
        return MaterialPageRoute(
          builder:
              (_) => EnviromentalHealth(
                countryDataModel: settings.arguments as CountryDataModel,
              ),
        );
      case Routes.game:
        return MaterialPageRoute(
          builder: (_) => OpenLink(urlTitle: settings.arguments as URLTitle),
        );
      default:
        return null;
    }
  }
}
