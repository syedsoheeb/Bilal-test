import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/services.dart';
import '../utils/app_styles.dart';
import '../utils/app_theme.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quranService = Provider.of<QuranService>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quran'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              // Show favorites
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search surahs...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onChanged: (value) {
                  // Filter surahs
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: quranService.surahs.length,
                itemBuilder: (context, index) {
                  final surah = quranService.surahs[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppColors.primary,
                        child: Text(
                          '${surah['number']}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(surah['englishName']),
                      subtitle: Text(
                        '${surah['englishNameTranslation']} - ${surah['numberOfAyahs']} verses',
                      ),
                      trailing: Text(
                        surah['name'],
                        style: AppStyles.arabicStyle,
                      ),
                      onTap: () {
                        // Navigate to surah details
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show dialog to select audio player
        },
        child: const Icon(Icons.play_arrow),
        tooltip: 'Play Audio',
      ),
    );
  }
}
