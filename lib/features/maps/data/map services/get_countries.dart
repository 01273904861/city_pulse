import 'dart:convert';

import 'package:city_pulse/features/maps/data/models/country_data_model.dart';
import 'package:flutter/services.dart';

Future<List<CountryDataModel>> getCountries() async{
  List<CountryDataModel> countries = [];
   
       final String response = await rootBundle.loadString(
      'assets/world_cities_70.json',
    );
    final data = await jsonDecode(response);
    countries = CountryDataModel.fromJsonList(data);
  return countries;
}