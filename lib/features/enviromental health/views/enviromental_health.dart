import 'package:city_pulse/core/consts/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:city_pulse/features/maps/data/models/country_data_model.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class EnviromentalHealth extends StatelessWidget {
  const EnviromentalHealth({super.key, this.countryDataModel});

  final CountryDataModel? countryDataModel;

  @override
  Widget build(BuildContext context) {
    final List<double> aqi =
        countryDataModel!.environment.aqi.map((e) => e.toDouble()).toList();
    final List<double> temp =
        countryDataModel!.environment.temp.map((e) => e.toDouble()).toList();

    return Scaffold(
      backgroundColor: const Color(0xFF1C1E26), // خلفية غامقة
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "${countryDataModel!.city} - Environmental Health",
          style: const TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ----- Chart -----
            SizedBox(
              height: 300,
              width: double.infinity,
              child: LineChart(
                LineChartData(
                  backgroundColor: const Color(0xFF2A2D3A),
                  gridData: FlGridData(show: true, drawVerticalLine: false),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            value.toInt().toString(),
                            style: const TextStyle(
                              color: Colors.white,
                            ), // ✅ أبيض
                          );
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            value.toInt().toString(),
                            style: const TextStyle(
                              color: Colors.white,
                            ), // ✅ أبيض
                          );
                        },
                      ),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  minX: 0,
                  maxX: (aqi.length - 1).toDouble(),
                  minY: 0,
                  maxY:
                      [...aqi, ...temp].reduce((a, b) => a > b ? a : b) +
                      20, // أكبر قيمة + 20
                  lineBarsData: [
                    // AQI Line
                    LineChartBarData(
                      spots:
                          aqi
                              .asMap()
                              .entries
                              .map((e) => FlSpot(e.key.toDouble(), e.value))
                              .toList(),
                      isCurved: false,
                      color: Colors.greenAccent,
                      barWidth: 3,
                      dotData: FlDotData(show: true),
                    ),
                    // Temp Line
                    LineChartBarData(
                      spots:
                          temp
                              .asMap()
                              .entries
                              .map((e) => FlSpot(e.key.toDouble(), e.value))
                              .toList(),
                      isCurved: false,
                      color: Colors.orangeAccent,
                      barWidth: 3,
                      dotData: FlDotData(show: true),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // ----- Values Row -----
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCircleIndicator(
                  "AQI",
                  aqi.last.toDouble(),
                  "Good",
                  Colors.greenAccent,
                ),
                _buildCircleIndicator(
                  "Temp",
                  temp.last.toDouble(),
                  "",
                  Colors.orangeAccent,
                ),
                _buildCircleIndicator("Noise", 45.0, "Calm", Colors.blueAccent),
              ],
            ),

            const SizedBox(height: 20),

            // ----- Data Sources -----
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Data Sources",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DataSourceWidget(
                    title: "Air Quality:",
                    subTitle: "Open Aq api",
                  ),
                  DataSourceWidget(
                    title: "heat Index",
                    subTitle: "NASA Landset 9",
                  ),
                  DataSourceWidget(
                    title: "Noise Level",
                    subTitle: "Local iot sensors",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ----- Tips -----
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.lightBlack,
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Tips & Actions",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "- Avoid strenuous outdoor activity.\n- Keep windows closed on high pollution days.",
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircleIndicator(
    String title,
    double value,
    String subtitle,
    Color color,
  ) {
    return CircularPercentIndicator(
      animationDuration: 1000,
      radius: 30,
      percent: value / 100,
      lineWidth: 3.0,
      animation: true,
      circularStrokeCap: CircularStrokeCap.round,
      center: Text(
        '${(value).toInt()}%',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.white,
        ),
      ),
      progressColor: color,
      backgroundColor: Colors.white24,
    );
  }
}

class DataSourceWidget extends StatelessWidget {
  const DataSourceWidget({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return 
    
    Expanded(
      child: Container(
           
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.lightBlack,
        ),
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(subTitle, style: TextStyle(color: Colors.white, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

