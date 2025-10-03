import 'package:city_pulse/core/app_assets.dart';
import 'package:city_pulse/features/maps/data/models/country_data_model.dart';

// Utility function to calculate the average of a List<int>
double _calculateAvg(List<int> values) {
  if (values.isEmpty) return 0.0;
  final sum = values.reduce((a, b) => a + b);
  return sum / values.length;
}

/// Determines the color classification for a city based on environment and wellbeing data.
/// * Criteria (based on AQI/Temp scaled 1-100):
/// - RED: High Stress ("high") AND High Pollution (Avg AQI > 75)
/// - GREEN: Clean Air (Avg AQI < 35) AND Abundant Green Spaces ("many")
/// - BLUE: Clean Water ("abundant" or "stable") AND High Social Activity ("dynamic" or "active")
/// - YELLOW: Moderate Health (Default if no other conditions are met)
///
/// @param cityData The CountryDataModel instance for a specific city.
/// @returns The classification color name: 'Red', 'Yellow', 'Green', or 'Blue'.
String getHeartColor(CountryDataModel cityData) {
  final avgAqi = _calculateAvg(cityData.environment.aqi);
  final stressLevel = cityData.wellbeing.stressLevel;
  final greenSpaces = cityData.resources.greenSpaces;
  final water = cityData.resources.water;
  final socialVibe = cityData.wellbeing.socialVibe;

  // --- 1. Check for RED conditions (Highest priority) ---
  // Red: High stress ("high") AND High Pollution (Avg AQI > 75)
  if (stressLevel == 'high' && avgAqi > 75) {
    return Assets.imagesReadHeart;
  }

  // --- 2. Check for GREEN conditions ---
  // Green: Clean Air (Avg AQI < 35) AND Abundant Green Spaces ("many")
  if (avgAqi < 35 && greenSpaces == 'many') {
    return Assets.imagesGreenHeart;
  }

  // --- 3. Check for BLUE conditions ---
  // Blue: Clean Water ("abundant" or "stable") AND High Social Activity ("dynamic" or "active")
  if ((water == 'abundant' || water == 'stable') &&
      (socialVibe == 'dynamic' || socialVibe == 'active')) {
    return Assets.imagesBlueHeart;
  }

  // --- 4. Default to YELLOW ---
  // Yellow: Moderate Health
  return Assets.imagesYellowHeart;
}
