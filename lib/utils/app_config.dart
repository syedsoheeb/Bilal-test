class AppConfig {
  static const String appName = "Bilal The Muezzin";
  static const String appVersion = "1.0.0";
  static const String apiBaseUrl = "https://api.aladhan.com/v1";
  static const String prayerTimesEndpoint = "/timingsByCity";
  static const String nearbyMosquesEndpoint = "https://overpass-api.de/api/interpreter";
  
  // Default location
  static const double defaultLatitude = 21.4225;
  static const double defaultLongitude = 39.8262;
  static const String defaultCity = "Makkah";
  static const String defaultCountry = "Saudi Arabia";
  
  // Prayer settings
  static const String defaultCalculationMethod = "Umm al-Qura";
  static const int defaultAdjustmentMinutes = 0;
  
  // Audio settings
  static const double defaultVolume = 0.7;
  static const bool defaultPreAdhanAlert = false;
  
  // App settings
  static const bool defaultDarkMode = false;
  static const bool defaultShowNotifications = true;
}
