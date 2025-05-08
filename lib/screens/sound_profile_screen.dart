import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/services.dart';
import '../models/models.dart';
import '../utils/app_styles.dart';
import '../utils/app_theme.dart';

class SoundProfileScreen extends StatelessWidget {
  const SoundProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scheduleService = Provider.of<ScheduleService>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sound Profiles'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: scheduleService.soundProfiles.length,
          padding: const EdgeInsets.all(16.0),
          itemBuilder: (context, index) {
            final profile = scheduleService.soundProfiles[index];
            return Card(
              elevation: 2.0,
              margin: const EdgeInsets.only(bottom: 16.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          profile.name,
                          style: AppStyles.subheadingStyle,
                        ),
                        PopupMenuButton<String>(
                          itemBuilder: (context) => [
                            const PopupMenuItem(
                              value: 'edit',
                              child: Text('Edit'),
                            ),
                            const PopupMenuItem(
                              value: 'delete',
                              child: Text('Delete'),
                            ),
                          ],
                          onSelected: (value) {
                            if (value == 'edit') {
                              // Show edit dialog
                            } else if (value == 'delete') {
                              // Show delete confirmation
                            }
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    ListTile(
                      title: const Text('Adhan Audio'),
                      subtitle: Text(profile.adhanAudioPath.split('/').last),
                      trailing: IconButton(
                        icon: const Icon(Icons.play_arrow),
                        onPressed: () {
                          // Play adhan audio
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Volume'),
                      subtitle: Slider(
                        value: profile.volume,
                        min: 0.0,
                        max: 1.0,
                        divisions: 10,
                        label: '${(profile.volume * 100).round()}%',
                        onChanged: (value) {
                          // Update volume
                        },
                      ),
                    ),
                    SwitchListTile(
                      title: const Text('Pre-Adhan Alert'),
                      subtitle: const Text('Play alert sound before adhan'),
                      value: profile.preAdhanAlert,
                      onChanged: (value) {
                        // Update pre-adhan alert
                      },
                    ),
                    if (profile.preAdhanAlert && profile.preAdhanAlertAudioPath != null)
                      ListTile(
                        title: const Text('Alert Sound'),
                        subtitle: Text(profile.preAdhanAlertAudioPath!.split('/').last),
                        trailing: IconButton(
                          icon: const Icon(Icons.play_arrow),
                          onPressed: () {
                            // Play alert audio
                          },
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show add profile dialog
        },
        child: const Icon(Icons.add),
        tooltip: 'Add Sound Profile',
      ),
    );
  }
}
