import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/models.dart';

class QuranService extends ChangeNotifier {
  List<Map<String, dynamic>> _surahs = [];
  List<QuranSelection> _favorites = [];
  
  // Getters
  List<Map<String, dynamic>> get surahs => _surahs;
  List<QuranSelection> get favorites => _favorites;
  
  Future<void> initialize() async {
    await fetchSurahs();
    loadFavorites();
  }
  
  Future<void> fetchSurahs() async {
    try {
      // In a real app, this would call an actual Quran API
      // For now, we'll add some sample data
      _surahs = [
        {
          'number': 1,
          'name': 'سُورَةُ ٱلْفَاتِحَةِ',
          'englishName': 'Al-Fatiha',
          'englishNameTranslation': 'The Opening',
          'numberOfAyahs': 7,
          'revelationType': 'Meccan',
        },
        {
          'number': 2,
          'name': 'سُورَةُ البَقَرَةِ',
          'englishName': 'Al-Baqarah',
          'englishNameTranslation': 'The Cow',
          'numberOfAyahs': 286,
          'revelationType': 'Medinan',
        },
        {
          'number': 3,
          'name': 'سُورَةُ آلِ عِمۡرَانَ',
          'englishName': 'Aal-Imran',
          'englishNameTranslation': 'The Family of Imran',
          'numberOfAyahs': 200,
          'revelationType': 'Medinan',
        },
      ];
      
      notifyListeners();
    } catch (e) {
      print('Error fetching surahs: $e');
    }
  }
  
  Future<void> loadFavorites() async {
    // In a real app, this would load saved favorites from storage
    _favorites = [
      QuranSelection(
        surahNumber: 1,
        surahName: 'Al-Fatiha',
        arabicName: 'سُورَةُ ٱلْفَاتِحَةِ',
        verseStart: 1,
        verseEnd: 7,
        reciterName: 'Mishary Rashid Alafasy',
      ),
    ];
    
    notifyListeners();
  }
  
  Future<void> addToFavorites(QuranSelection selection) async {
    _favorites = [..._favorites, selection];
    // In a real app, this would save favorites to storage
    notifyListeners();
  }
  
  Future<void> removeFromFavorites(int surahNumber, int verseStart, int verseEnd) async {
    _favorites = _favorites.where((selection) => 
      !(selection.surahNumber == surahNumber && 
        selection.verseStart == verseStart && 
        selection.verseEnd == verseEnd)
    ).toList();
    
    // In a real app, this would update storage
    notifyListeners();
  }
}
