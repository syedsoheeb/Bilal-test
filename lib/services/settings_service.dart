import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsService extends ChangeNotifier {
  late SharedPreferences _prefs;
  
  // Default values
  String _deviceName = 'Home group';
  String _deviceType = 'google_cast';
  String _city = 'Makkah';
  String _country = 'Saudi Arabia';
  double _latitude = 21.3891;
  double _longitude = 39.8579;
  String _calculationMethod = 'Umm al-Qura';
  bool _isDarkMode = false;
  bool _autoLocation = false;
  bool _showNotifications = true;
  
  // Getters
  String get deviceName => _deviceName;
  String get deviceType => _deviceType;
  String get city => _city;
  String get country => _country;
  double get latitude => _latitude;
  double get longitude => _longitude;
  String get calculationMethod => _calculationMethod;
  bool get isDarkMode => _isDarkMode;
  bool get autoLocation => _autoLocation;
  bool get showNotifications => _showNotifications;
  
  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
    
    // Load saved settings
    _deviceName = _prefs.getString('deviceName') ?? _deviceName;
    _deviceType = _prefs.getString('deviceType') ?? _deviceType;
    _city = _prefs.getString('city') ?? _city;
    _country = _prefs.getString('country') ?? _country;
    _latitude = _prefs.getDouble('latitude') ?? _latitude;
    _longitude = _prefs.getDouble('longitude') ?? _longitude;
    _calculationMethod = _prefs.getString('calculationMethod') ?? _calculationMethod;
    _isDarkMode = _prefs.getBool('isDarkMode') ?? _isDarkMode;
    _autoLocation = _prefs.getBool('autoLocation') ?? _autoLocation;
    _showNotifications = _prefs.getBool('showNotifications') ?? _showNotifications;
  }
  
  // Setters
  Future<void> setDeviceName(String name) async {
    _deviceName = name;
    await _prefs.setString('deviceName', name);
    notifyListeners();
  }
  
  Future<void> setDeviceType(String type) async {
    _deviceType = type;
    await _prefs.setString('deviceType', type);
    notifyListeners();
  }
  
  Future<void> setLocation({
    required String city,
    required String country,
    required double latitude,
    required double longitude,
  }) async {
    _city = city;
    _country = country;
    _latitude = latitude;
    _longitude = longitude;
    
    await _prefs.setString('city', city);
    await _prefs.setString('country', country);
    await _prefs.setDouble('latitude', latitude);
    await _prefs.setDouble('longitude', longitude);
    
    notifyListeners();
  }
  
  Future<void> setCalculationMethod(String method) async {
    _calculationMethod = method;
    await _prefs.setString('calculationMethod', method);
    notifyListeners();
  }
  
  Future<void> setDarkMode(bool value) async {
    _isDarkMode = value;
    await _prefs.setBool('isDarkMode', value);
    notifyListeners();
  }
  
  Future<void> setAutoLocation(bool value) async {
    _autoLocation = value;
    await _prefs.setBool('autoLocation', value);
    notifyListeners();
  }
  
  Future<void> setShowNotifications(bool value) async {
    _showNotifications = value;
    await _prefs.setBool('showNotifications', value);
    notifyListeners();
  }
}
