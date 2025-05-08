import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/services.dart';
import '../utils/app_styles.dart';
import '../utils/app_theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settingsService = Provider.of<SettingsService>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
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
                      Text(
                        'Location Settings',
                        style: AppStyles.subheadingStyle,
                      ),
                      const SizedBox(height: 16.0),
                      SwitchListTile(
                        title: const Text('Use Automatic Location'),
                        subtitle: const Text('Detect location automatically'),
                        value: settingsService.autoLocation,
                        onChanged: (value) {
                          settingsService.setAutoLocation(value);
                        },
                      ),
                      ListTile(
                        title: const Text('Location'),
                        subtitle: Text('${settingsService.city}, ${settingsService.country}'),
                        trailing: const Icon(Icons.edit),
                        onTap: () {
                          // Show location edit dialog
                        },
                      ),
                      ListTile(
                        title: const Text('Calculation Method'),
                        subtitle: Text(settingsService.calculationMethod),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          // Show calculation method selection
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Card(
                elevation: 2.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Device Settings',
                        style: AppStyles.subheadingStyle,
                      ),
                      const SizedBox(height: 16.0),
                      ListTile(
                        title: const Text('Default Device'),
                        subtitle: Text(settingsService.deviceName),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          // Show device selection
                        },
                      ),
                      ListTile(
                        title: const Text('Device Type'),
                        subtitle: Text(settingsService.deviceType == 'google_cast' ? 'Google Cast' : 'Amazon Alexa'),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          // Show device type selection
                        },
                      ),
                      ListTile(
                        title: const Text('Manage Speaker Groups'),
                        subtitle: const Text('Create and edit speaker groups'),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          // Navigate to speaker group management
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Card(
                elevation: 2.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'App Settings',
                        style: AppStyles.subheadingStyle,
                      ),
                      const SizedBox(height: 16.0),
                      SwitchListTile(
                        title: const Text('Dark Mode'),
                        subtitle: const Text('Enable dark theme'),
                        value: settingsService.isDarkMode,
                        onChanged: (value) {
                          settingsService.setDarkMode(value);
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Notifications'),
                        subtitle: const Text('Enable prayer time notifications'),
                        value: settingsService.showNotifications,
                        onChanged: (value) {
                          settingsService.setShowNotifications(value);
                        },
                      ),
                      ListTile(
                        title: const Text('Sound Profiles'),
                        subtitle: const Text('Manage sound profiles'),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          // Navigate to sound profile screen
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Card(
                elevation: 2.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About',
                        style: AppStyles.subheadingStyle,
                      ),
                      const SizedBox(height: 16.0),
                      ListTile(
                        title: const Text('Version'),
                        subtitle: const Text('1.0.0'),
                      ),
                      ListTile(
                        title: const Text('Feedback'),
                        subtitle: const Text('Send feedback or report issues'),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          // Open feedback form
                        },
                      ),
                      ListTile(
                        title: const Text('Privacy Policy'),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          // Show privacy policy
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
