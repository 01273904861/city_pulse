import 'package:city_pulse/core/app_assets.dart';
import 'package:city_pulse/core/widgets/custom_elevated_button.dart';
import 'package:city_pulse/features/on%20boarding/views/on_boarding_view.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationAccessScreen extends StatelessWidget {
  const LocationAccessScreen({super.key});

  Future<void> _requestLocationAccess(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if GPS شغال
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("الـ GPS مقفول، افتحه من الإعدادات")),
      );
      return;
    }

    // Check permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("محتاج إذن الموقع")));
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("اذهب إلى الإعدادات واسمح بالوصول للموقع"),
        ),
      );
      return;
    }

    // لما يوافق يروح للخريطة
    Navigator.pushReplacementNamed(context, "/map");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E1A2A),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.imagesLocationAccess, width: 200),
            const SizedBox(height: 20),
            const Text(
              "Connect to Your City",
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Enable location access to personalize your experience.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => _requestLocationAccess(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
              ),
              child: const Text(
                "Allow Location Access",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              "Your data is safe and will not be shared",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
