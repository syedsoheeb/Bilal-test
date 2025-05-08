import 'dart:math';
import 'package:flutter/material.dart';
import '../models/models.dart';

class DhikrService {
  // Daily Dhikr
  List<DhikrEntry> getDailyDhikr() {
    return [
      DhikrEntry(
        id: 1,
        arabic: 'سُبْحَانَ اللَّهِ',
        translation: 'Glory be to Allah',
        transliteration: "Subhan Allah",
        benefit: 'Glorification of Allah',
        source: 'Hadith',
        count: 33,
        category: 'daily',
      ),
      DhikrEntry(
        id: 2,
        arabic: 'الْحَمْدُ لِلَّهِ',
        translation: 'All praise is due to Allah',
        transliteration: "Alhamdulillah",
        benefit: 'Gratitude to Allah',
        source: 'Hadith',
        count: 33,
        category: 'daily',
      ),
      DhikrEntry(
        id: 3,
        arabic: 'اللَّهُ أَكْبَرُ',
        translation: 'Allah is the Greatest',
        transliteration: "Allahu Akbar",
        benefit: 'Magnification of Allah',
        source: 'Hadith',
        count: 34,
        category: 'daily',
      ),
      DhikrEntry(
        id: 4,
        arabic: 'لَا إِلَٰهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ، وَهُوَ عَلَىٰ كُلِّ شَيْءٍ قَدِيرٌ',
        translation: 'There is no deity worthy of worship except Allah, alone, without partner. To Him belongs sovereignty and all praise, and He is over all things competent.',
        transliteration: "La ilaha illallah wahdahu la sharika lah, lahul-mulku wa lahul-hamd, wa huwa ala kulli shayin qadir",
        benefit: 'Affirmation of Tawhid (Oneness of Allah)',
        source: 'Bukhari and Muslim',
        count: 10,
        category: 'daily',
      ),
    ];
  }

  // Get a random dhikr
  DhikrEntry getRandomDhikr() {
    final dhikrList = getDailyDhikr();
    final random = Random();
    return dhikrList[random.nextInt(dhikrList.length)];
  }
}
