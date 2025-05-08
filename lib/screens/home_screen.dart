import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/services.dart';
import '../widgets/prayer_card.dart';
import '../widgets/daily_dhikr_card.dart';
import '../widgets/hijri_date_display.dart';
import '../utils/app_theme.dart';
import '../utils/app_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settingsService = Provider.of<SettingsService>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bilal The Muezzin'),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HijriDateDisplay(),
              const SizedBox(height: 16.0),
              Text(
                'Welcome to Bilal',
                style: AppStyles.headingStyle,
              ),
              const SizedBox(height: 8.0),
              Text(
                'Your Islamic prayer companion',
                style: AppStyles.bodyStyle,
              ),
              const SizedBox(height: 24.0),
              const PrayerCard(),
              const SizedBox(height: 24.0),
              const DailyDhikrCard(),
              const SizedBox(height: 24.0),
              Card(
                elevation: 2.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Quick Actions',
                        style: AppStyles.subheadingStyle,
                      ),
                      const SizedBox(height: 16.0),
                      ListTile(
                        leading: const Icon(Icons.speaker, color: AppColors.primary),
                        title: const Text('Test Audio Devices'),
                        subtitle: const Text('Play test sound on your speakers'),
                        onTap: () {
                          // Navigate to audio device test
                        },
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.schedule, color: AppColors.primary),
                        title: const Text('Schedule Azaan'),
                        subtitle: const Text('Set up prayer time schedules'),
                        onTap: () {
                          // Navigate to schedule screen
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
