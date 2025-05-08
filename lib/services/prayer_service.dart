import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import '../models/models.dart';
import 'settings_service.dart';

class PrayerService extends ChangeNotifier {
  final SettingsService _settingsService;
  
  PrayerTimes? _prayerTimes;
  DateTime? _lastUpdated;
  String? _hijriDate;
  
  PrayerService(this._settingsService);
  
  // Getters
  PrayerTimes? get prayerTimes => _prayerTimes;
  DateTime? get lastUpdated => _lastUpdated;
  String? get hijriDate => _hijriDate;
  
  Future<void> initialize() async {
    await fetchPrayerTimes();
  }
  
  Future<void> fetchPrayerTimes() async {
    try {
      final latitude = _settingsService.latitude;
      final longitude = _settingsService.longitude;
      
      // In a real app, this would call an actual prayer times API
      // For now, we'll simulate the response
      final now = DateTime.now();
      final formatter = DateFormat('HH:mm');
      
      _prayerTimes = PrayerTimes(
        fajr: formatter.format(DateTime(now.year, now.month, now.day, 5, 30)),
        sunrise: formatter.format(DateTime(now.year, now.month, now.day, 7, 0)),
        dhuhr: formatter.format(DateTime(now.year, now.month, now.day, 12, 30)),
        asr: formatter.format(DateTime(now.year, now.month, now.day, 15, 45)),
        maghrib: formatter.format(DateTime(now.year, now.month, now.day, 18, 15)),
        isha: formatter.format(DateTime(now.year, now.month, now.day, 19, 45)),
        midnight: formatter.format(DateTime(now.year, now.month, now.day, 0, 0)),
      );
      
      _lastUpdated = now;
      
      // Get Hijri date
      await fetchHijriDate();
      
      notifyListeners();
    } catch (e) {
      print('Error fetching prayer times: $e');
    }
  }
  
  Future<void> fetchHijriDate() async {
    try {
      // In a real app, this would call an actual Hijri date API
      // For now, we'll set a hardcoded value
      _hijriDate = '15 Ramadan 1445';
      notifyListeners();
    } catch (e) {
      print('Error fetching Hijri date: $e');
    }
  }
  
  String getNextPrayer() {
    if (_prayerTimes == null) return 'Unknown';
    
    final now = DateTime.now();
    final formatter = DateFormat('HH:mm');
    final currentTime = formatter.format(now);
    
    final prayers = {
      'Fajr': _prayerTimes!.fajr,
      'Sunrise': _prayerTimes!.sunrise,
      'Dhuhr': _prayerTimes!.dhuhr,
      'Asr': _prayerTimes!.asr,
      'Maghrib': _prayerTimes!.maghrib,
      'Isha': _prayerTimes!.isha,
    };
    
    String nextPrayer = 'Fajr';
    String nextTime = prayers['Fajr']!;
    
    for (final entry in prayers.entries) {
      if (entry.value.compareTo(currentTime) > 0) {
        nextPrayer = entry.key;
        nextTime = entry.value;
        break;
      }
    }
    
    return '$nextPrayer ($nextTime)';
  }
}
