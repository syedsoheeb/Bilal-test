class PrayerTimes {
  final String fajr;
  final String sunrise;
  final String dhuhr;
  final String asr;
  final String maghrib;
  final String isha;
  final String midnight;
  
  PrayerTimes({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
    required this.midnight,
  });
}

class Mosque {
  final String name;
  final String address;
  final double distance;
  final double latitude;
  final double longitude;
  final String? website;
  final String? phone;
  
  Mosque({
    required this.name,
    required this.address,
    required this.distance,
    required this.latitude,
    required this.longitude,
    this.website,
    this.phone,
  });
}

class AudioDevice {
  final String id;
  final String name;
  final String type;
  final bool isConnected;
  final String? speakerGroupId = null; // Reference to speaker group
  
  AudioDevice({
    required this.id,
    required this.name,
    required this.type,
    required this.isConnected,
  });
}

class SpeakerGroup {
  final String id;
  final String name;
  final List<String> deviceIds;
  
  SpeakerGroup({
    required this.id,
    required this.name,
    required this.deviceIds,
  });
}

class Schedule {
  final int id;
  final String name;
  final String prayerTime;
  final List<String> days;
  final String deviceId;
  final bool isActive;
  final String soundProfile;
  
  Schedule({
    required this.id,
    required this.name,
    required this.prayerTime,
    required this.days,
    required this.deviceId,
    required this.isActive,
    required this.soundProfile,
  });
}

class AzkarSchedule {
  final int id;
  final String name;
  final String azkarType;
  final String time;
  final List<String> days;
  final String deviceId;
  final bool isActive;
  
  AzkarSchedule({
    required this.id,
    required this.name,
    required this.azkarType,
    required this.time,
    required this.days,
    required this.deviceId,
    required this.isActive,
  });
}

class SoundProfile {
  final String id;
  final String name;
  final String adhanAudioPath;
  final double volume;
  final bool preAdhanAlert;
  final String? preAdhanAlertAudioPath;
  
  SoundProfile({
    required this.id,
    required this.name,
    required this.adhanAudioPath,
    required this.volume,
    required this.preAdhanAlert,
    this.preAdhanAlertAudioPath,
  });
}

class DhikrEntry {
  final int id;
  final String arabic;
  final String translation;
  final String transliteration;
  final String benefit;
  final String source;
  final int count;
  final String category;

  DhikrEntry({
    required this.id,
    required this.arabic,
    required this.translation,
    required this.transliteration,
    required this.benefit,
    required this.source,
    required this.count,
    required this.category,
  });
}

class QuranSelection {
  final int surahNumber;
  final String surahName;
  final String arabicName;
  final int verseStart;
  final int verseEnd;
  final String reciterName;
  
  QuranSelection({
    required this.surahNumber,
    required this.surahName,
    required this.arabicName,
    required this.verseStart,
    required this.verseEnd,
    required this.reciterName,
  });
}
