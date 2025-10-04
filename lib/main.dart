import 'package:city_pulse/core/consts/app_colors.dart';
import 'package:city_pulse/core/routing/app_router.dart';
import 'package:city_pulse/core/routing/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CityPulse());
}

class CityPulse extends StatelessWidget {
  const CityPulse({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppColors.mainColor,
        primaryColorDark: AppColors.mainColor,
       scaffoldBackgroundColor: AppColors.mainColor,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: Routes.home,
    );
  }
}
