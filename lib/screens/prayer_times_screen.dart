import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/services.dart';
import '../models/models.dart';
import '../utils/app_styles.dart';
import '../utils/app_theme.dart';

class PrayerTimesScreen extends StatelessWidget {
  const PrayerTimesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prayerService = Provider.of<PrayerService>(context);
    final settingsService = Provider.of<SettingsService>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prayer Times'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              prayerService.fetchPrayerTimes();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 2.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${settingsService.city}, ${settingsService.country}',
                            style: AppStyles.subheadingStyle,
                          ),
                          TextButton.icon(
                            icon: const Icon(Icons.edit_location),
                            label: const Text('Change'),
                            onPressed: () {
                              // Show location change dialog
                            },
                          ),
                        ],
                      ),
                      Text(
                        'Calculation Method: ${settingsService.calculationMethod}',
                        style: AppStyles.captionStyle,
                      ),
                      if (prayerService.lastUpdated != null)
                        Text(
                          'Last Updated: ${prayerService.lastUpdated.toString().substring(0, 16)}',
                          style: AppStyles.captionStyle,
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              _buildPrayerTimesList(context, prayerService),
              const SizedBox(height: 24.0),
              _buildNearbyMosquesSection(context, settingsService),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildPrayerTimesList(BuildContext context, PrayerService prayerService) {
    final prayerTimes = prayerService.prayerTimes;
    
    if (prayerTimes == null) {
      return const Center(child: CircularProgressIndicator());
    }
    
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Today\'s Prayer Times',
              style: AppStyles.subheadingStyle,
            ),
            const SizedBox(height: 16.0),
            _buildPrayerTimeItem(context, 'Fajr', prayerTimes.fajr, Icons.nightlight_round),
            const Divider(),
            _buildPrayerTimeItem(context, 'Sunrise', prayerTimes.sunrise, Icons.wb_sunny_outlined),
            const Divider(),
            _buildPrayerTimeItem(context, 'Dhuhr', prayerTimes.dhuhr, Icons.wb_sunny),
            const Divider(),
            _buildPrayerTimeItem(context, 'Asr', prayerTimes.asr, Icons.wb_twighlight),
            const Divider(),
            _buildPrayerTimeItem(context, 'Maghrib', prayerTimes.maghrib, Icons.wb_twilight),
            const Divider(),
            _buildPrayerTimeItem(context, 'Isha', prayerTimes.isha, Icons.nights_stay),
          ],
        ),
      ),
    );
  }
  
  Widget _buildPrayerTimeItem(BuildContext context, String name, String time, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary),
          const SizedBox(width: 16.0),
          Text(
            name,
            style: AppStyles.bodyStyle,
          ),
          const Spacer(),
          Text(
            time,
            style: AppStyles.bodyStyle.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildNearbyMosquesSection(BuildContext context, SettingsService settingsService) {
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nearby Mosques',
              style: AppStyles.subheadingStyle,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton.icon(
              icon: const Icon(Icons.mosque),
              label: const Text('Find Nearby Mosques'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
                // Show nearby mosques
              },
            ),
          ],
        ),
      ),
    );
  }
}
