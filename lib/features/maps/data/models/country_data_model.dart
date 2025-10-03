class CountryDataModel {
  final int id;
  final String country;
  final String city;
  final double lat;
  final double lng;
  final Environment environment;
  final Wellbeing wellbeing;
  final Resources resources;

  CountryDataModel({
    required this.id,
    required this.country,
    required this.city,
    required this.lat,
    required this.lng,
    required this.environment,
    required this.wellbeing,
    required this.resources,
  });

  factory CountryDataModel.fromJson(Map<String, dynamic> json) {
    return CountryDataModel(
      id: json['id'],
      country: json['country'],
      city: json['city'],
      lat: json['lat'].toDouble(),
      lng: json['lng'].toDouble(),
      environment: Environment.fromJson(json['environment']),
      wellbeing: Wellbeing.fromJson(json['wellbeing']),
      resources: Resources.fromJson(json['resources']),
    );
  }

  static List<CountryDataModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => CountryDataModel.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'country': country,
      'city': city,
      'lat': lat,
      'lng': lng,
      'environment': environment.toJson(),
      'wellbeing': wellbeing.toJson(),
      'resources': resources.toJson(),
    };
  }
}

class Environment {
  final List<int> aqi;
  final List<int> temp;
  final int humidity;
  final int noiseLevel;

  Environment({
    required this.aqi,
    required this.temp,
    required this.humidity,
    required this.noiseLevel,
  });

  factory Environment.fromJson(Map<String, dynamic> json) {
    return Environment(
      aqi: List<int>.from(json['aqi'] as List<dynamic>),
      temp: List<int>.from(json['temp'] as List<dynamic>),
      humidity: json['humidity'],
      noiseLevel: json['noiseLevel'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'aqi': aqi,
      'temp': temp,
      'humidity': humidity,
      'noiseLevel': noiseLevel,
    };
  }
}

class Wellbeing {
  final int moodScore;
  final String socialVibe;
  final int connectivityScore;
  final String stressLevel;

  Wellbeing({
    required this.moodScore,
    required this.socialVibe,
    required this.connectivityScore,
    required this.stressLevel,
  });

  factory Wellbeing.fromJson(Map<String, dynamic> json) {
    return Wellbeing(
      moodScore: json['moodScore'],
      socialVibe: json['socialVibe'],
      connectivityScore: json['connectivityScore'],
      stressLevel: json['stressLevel'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'moodScore': moodScore,
      'socialVibe': socialVibe,
      'connectivityScore': connectivityScore,
      'stressLevel': stressLevel,
    };
  }
}

class Resources {
  final String water;
  final String electricity;
  final String greenSpaces;
  final String healthcare;

  Resources({
    required this.water,
    required this.electricity,
    required this.greenSpaces,
    required this.healthcare,
  });

  factory Resources.fromJson(Map<String, dynamic> json) {
    return Resources(
      water: json['water'],
      electricity: json['electricity'],
      greenSpaces: json['greenSpaces'],
      healthcare: json['healthcare'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'water': water,
      'electricity': electricity,
      'greenSpaces': greenSpaces,
      'healthcare': healthcare,
    };
  }
}
