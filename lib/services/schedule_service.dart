import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/models.dart';
import 'settings_service.dart';
import 'prayer_service.dart';
import 'audio_device_service.dart';

class ScheduleService extends ChangeNotifier {
  final SettingsService _settingsService;
  final PrayerService _prayerService;
  final AudioDeviceService _audioDeviceService;
  
  List<Schedule> _schedules = [];
  List<AzkarSchedule> _azkarSchedules = [];
  List<SoundProfile> _soundProfiles = [];
  
  ScheduleService({
    required SettingsService settingsService,
    required PrayerService prayerService,
    required AudioDeviceService audioDeviceService,
  }) : _settingsService = settingsService,
       _prayerService = prayerService,
       _audioDeviceService = audioDeviceService;
  
  // Getters
  List<Schedule> get schedules => _schedules;
  List<AzkarSchedule> get azkarSchedules => _azkarSchedules;
  List<SoundProfile> get soundProfiles => _soundProfiles;
  
  Future<void> initialize() async {
    await loadSchedules();
    await loadAzkarSchedules();
    await loadSoundProfiles();
  }
  
  Future<void> loadSchedules() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final schedulesJson = prefs.getStringList('schedules') ?? [];
      
      _schedules = schedulesJson.map((json) {
        final Map<String, dynamic> data = jsonDecode(json);
        return Schedule(
          id: data['id'],
          name: data['name'],
          prayerTime: data['prayerTime'],
          days: List<String>.from(data['days']),
          deviceId: data['deviceId'],
          isActive: data['isActive'],
          soundProfile: data['soundProfile'],
        );
      }).toList();
      
      if (_schedules.isEmpty) {
        // Add a default schedule if none exists
        _schedules = [
          Schedule(
            id: 1,
            name: 'Fajr Prayer',
            prayerTime: 'Fajr',
            days: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'],
            deviceId: 'device1',
            isActive: true,
            soundProfile: 'profile1',
          ),
        ];
      }
      
      notifyListeners();
    } catch (e) {
      print('Error loading schedules: $e');
    }
  }
  
  Future<void> loadAzkarSchedules() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final schedulesJson = prefs.getStringList('azkarSchedules') ?? [];
      
      _azkarSchedules = schedulesJson.map((json) {
        final Map<String, dynamic> data = jsonDecode(json);
        return AzkarSchedule(
          id: data['id'],
          name: data['name'],
          azkarType: data['azkarType'],
          time: data['time'],
          days: List<String>.from(data['days']),
          deviceId: data['deviceId'],
          isActive: data['isActive'],
        );
      }).toList();
      
      if (_azkarSchedules.isEmpty) {
        // Add some default azkar schedules if none exist
        _azkarSchedules = [
          AzkarSchedule(
            id: 1,
            name: 'Morning Azkar',
            azkarType: 'morning',
            time: '06:30',
            days: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'],
            deviceId: 'device1',
            isActive: true,
          ),
          AzkarSchedule(
            id: 2,
            name: 'Evening Azkar',
            azkarType: 'evening',
            time: '17:30',
            days: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'],
            deviceId: 'device1',
            isActive: true,
          ),
        ];
      }
      
      notifyListeners();
    } catch (e) {
      print('Error loading azkar schedules: $e');
    }
  }
  
  Future<void> loadSoundProfiles() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final profilesJson = prefs.getStringList('soundProfiles') ?? [];
      
      _soundProfiles = profilesJson.map((json) {
        final Map<String, dynamic> data = jsonDecode(json);
        return SoundProfile(
          id: data['id'],
          name: data['name'],
          adhanAudioPath: data['adhanAudioPath'],
          volume: data['volume'],
          preAdhanAlert: data['preAdhanAlert'],
          preAdhanAlertAudioPath: data['preAdhanAlertAudioPath'],
        );
      }).toList();
      
      if (_soundProfiles.isEmpty) {
        // Add some default sound profiles if none exist
        _soundProfiles = [
          SoundProfile(
            id: 'profile1',
            name: 'Makkah Adhan',
            adhanAudioPath: 'assets/audio/makkah_adhan.mp3',
            volume: 0.7,
            preAdhanAlert: false,
          ),
          SoundProfile(
            id: 'profile2',
            name: 'Madinah Adhan',
            adhanAudioPath: 'assets/audio/madinah_adhan.mp3',
            volume: 0.8,
            preAdhanAlert: true,
            preAdhanAlertAudioPath: 'assets/audio/pre_adhan_alert.mp3',
          ),
        ];
      }
      
      notifyListeners();
    } catch (e) {
      print('Error loading sound profiles: $e');
    }
  }
  
  // Save schedules
  Future<void> saveSchedules() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final schedulesJson = _schedules.map((schedule) => jsonEncode({
        'id': schedule.id,
        'name': schedule.name,
        'prayerTime': schedule.prayerTime,
        'days': schedule.days,
        'deviceId': schedule.deviceId,
        'isActive': schedule.isActive,
        'soundProfile': schedule.soundProfile,
      })).toList();
      
      await prefs.setStringList('schedules', schedulesJson);
    } catch (e) {
      print('Error saving schedules: $e');
    }
  }
  
  // Add a new schedule
  Future<void> addSchedule(Schedule schedule) async {
    _schedules = [..._schedules, schedule];
    await saveSchedules();
    notifyListeners();
  }
  
  // Update an existing schedule
  Future<void> updateSchedule(int id, Schedule updatedSchedule) async {
    final index = _schedules.indexWhere((schedule) => schedule.id == id);
    if (index != -1) {
      final newSchedules = List<Schedule>.from(_schedules);
      newSchedules[index] = updatedSchedule;
      _schedules = newSchedules;
      await saveSchedules();
      notifyListeners();
    }
  }
  
  // Delete a schedule
  Future<void> deleteSchedule(int id) async {
    _schedules = _schedules.where((schedule) => schedule.id != id).toList();
    await saveSchedules();
    notifyListeners();
  }
  
  // Save azkar schedules
  Future<void> saveAzkarSchedules() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final schedulesJson = _azkarSchedules.map((schedule) => jsonEncode({
        'id': schedule.id,
        'name': schedule.name,
        'azkarType': schedule.azkarType,
        'time': schedule.time,
        'days': schedule.days,
        'deviceId': schedule.deviceId,
        'isActive': schedule.isActive,
      })).toList();
      
      await prefs.setStringList('azkarSchedules', schedulesJson);
    } catch (e) {
      print('Error saving azkar schedules: $e');
    }
  }
  
  // Add a new azkar schedule
  Future<void> addAzkarSchedule(AzkarSchedule schedule) async {
    _azkarSchedules = [..._azkarSchedules, schedule];
    await saveAzkarSchedules();
    notifyListeners();
  }
  
  // Update an existing azkar schedule
  Future<void> updateAzkarSchedule(int id, AzkarSchedule updatedSchedule) async {
    final index = _azkarSchedules.indexWhere((schedule) => schedule.id == id);
    if (index != -1) {
      final newSchedules = List<AzkarSchedule>.from(_azkarSchedules);
      newSchedules[index] = updatedSchedule;
      _azkarSchedules = newSchedules;
      await saveAzkarSchedules();
      notifyListeners();
    }
  }
  
  // Delete an azkar schedule
  Future<void> deleteAzkarSchedule(int id) async {
    _azkarSchedules = _azkarSchedules.where((schedule) => schedule.id != id).toList();
    await saveAzkarSchedules();
    notifyListeners();
  }
  
  // Save sound profiles
  Future<void> saveSoundProfiles() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final profilesJson = _soundProfiles.map((profile) => jsonEncode({
        'id': profile.id,
        'name': profile.name,
        'adhanAudioPath': profile.adhanAudioPath,
        'volume': profile.volume,
        'preAdhanAlert': profile.preAdhanAlert,
        'preAdhanAlertAudioPath': profile.preAdhanAlertAudioPath,
      })).toList();
      
      await prefs.setStringList('soundProfiles', profilesJson);
    } catch (e) {
      print('Error saving sound profiles: $e');
    }
  }
  
  // Add a new sound profile
  Future<void> addSoundProfile(SoundProfile profile) async {
    _soundProfiles = [..._soundProfiles, profile];
    await saveSoundProfiles();
    notifyListeners();
  }
  
  // Update an existing sound profile
  Future<void> updateSoundProfile(String id, SoundProfile updatedProfile) async {
    final index = _soundProfiles.indexWhere((profile) => profile.id == id);
    if (index != -1) {
      final newProfiles = List<SoundProfile>.from(_soundProfiles);
      newProfiles[index] = updatedProfile;
      _soundProfiles = newProfiles;
      await saveSoundProfiles();
      notifyListeners();
    }
  }
  
  // Delete a sound profile
  Future<void> deleteSoundProfile(String id) async {
    _soundProfiles = _soundProfiles.where((profile) => profile.id != id).toList();
    await saveSoundProfiles();
    notifyListeners();
  }
}
