import 'package:city_pulse/core/consts/app_colors.dart';
import 'package:city_pulse/core/consts/app_strings.dart';
import 'package:city_pulse/core/routing/routes.dart';
import 'package:city_pulse/features/maps/data/map%20services/get_countries.dart';
import 'package:city_pulse/features/maps/data/models/country_data_model.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  List<CountryDataModel> cities = [];
  final MapController _mapController = MapController();
  LatLng? currentLocation;
  @override
  void initState() {
    super.initState();
    loadCities();
  }

  Future<void> loadCities() async {
    _getCurrentLocation();
    final data = await getCountries();
    setState(() {
      cities = data;
    });
  }

  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
    );
    setState(() {
      currentLocation = LatLng(position.latitude, position.longitude);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.mainColor,
        title: Text(
          "world's cities",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter:
                  currentLocation ?? LatLng(30.0444, 31.2357), // Cairo default
              initialZoom: 3,
            ),
            children: [
              TileLayer(
                urlTemplate: AppStrings.mapsUrl,
                subdomains: ['a', 'b', 'c'],
                userAgentPackageName:
                    'com.example.city_pulse', // ← غيرها باسم الباكيج بتاعك
              ),
              //mark cities
              MarkerLayer(
                markers:
                    cities.map((city) {
                      return Marker(
                        point: LatLng(city.lat.toDouble(), city.lng.toDouble()),
                        width: 40,
                        height: 40,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              Routes.heartBeat,
                              arguments: city,
                            );
                          },
                          child: Icon(
                            Icons.location_on,
                            color: Colors.red,
                            size: 30,
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ],
          ),

          // أزرار التكبير والتصغير
          Positioned(
            right: 10,
            bottom: 80,
            child: Column(
              children: [
                FloatingActionButton(
                  heroTag: "zoomIn",
                  mini: true,
                  onPressed: () {
                    _mapController.move(
                      _mapController.camera.center,
                      _mapController.camera.zoom + 1,
                    );
                  },
                  child: Icon(Icons.add),
                ),
                SizedBox(height: 10),
                FloatingActionButton(
                  heroTag: "zoomOut",
                  mini: true,
                  onPressed: () {
                    _mapController.move(
                      _mapController.camera.center,
                      _mapController.camera.zoom - 1,
                    );
                  },
                  child: Icon(Icons.remove),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
