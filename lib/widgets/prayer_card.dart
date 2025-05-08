import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/services.dart';
import '../utils/app_styles.dart';
import '../utils/app_theme.dart';

class PrayerCard extends StatelessWidget {
  const PrayerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prayerService = Provider.of<PrayerService>(context);
    final settingsService = Provider.of<SettingsService>(context);
    
    if (prayerService.prayerTimes == null) {
      return Card(
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                'Loading Prayer Times...',
                style: AppStyles.subheadingStyle,
              ),
              const SizedBox(height: 16.0),
              const CircularProgressIndicator(),
            ],
          ),
        ),
      );
    }
    
    final nextPrayer = prayerService.getNextPrayer();
    
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Next Prayer',
                  style: AppStyles.subheadingStyle,
                ),
                OutlinedButton.icon(
                  icon: const Icon(Icons.refresh),
                  label: const Text('Refresh'),
                  onPressed: () {
                    prayerService.fetchPrayerTimes();
                  },
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Text(
              nextPrayer,
              style: AppStyles.headingStyle.copyWith(
                color: AppColors.primary,
                fontSize: 28.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              '${settingsService.city}, ${settingsService.country}',
              style: AppStyles.captionStyle,
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.speaker),
                    label: const Text('Play Adhan Now'),
                    onPressed: () {
                      // Play adhan now
                    },
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.schedule),
                    label: const Text('Schedule'),
                    onPressed: () {
                      // Navigate to schedule screen
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
