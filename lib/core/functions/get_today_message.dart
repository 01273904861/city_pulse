  String getMessage(double aqi) {
    if (aqi <= 50) {
      return "The air is clear today 🌱 Take a deep breath.";
    } else if (aqi <= 100) {
      return "Air quality is acceptable 🙂 Stay active.";
    } else if (aqi <= 150) {
      return "Air quality is moderate 😐 Limit outdoor activity.";
    } else if (aqi <= 200) {
      return "Unhealthy air 🚫 Consider wearing a mask.";
    } else {
      return "Very unhealthy ⚠️ Stay indoors and stay safe.";
    }
  }