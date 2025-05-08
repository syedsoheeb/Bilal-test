import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/main_navigation_screen.dart';
import 'services/services.dart';
import 'utils/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize services
  final settingsService = SettingsService();
  await settingsService.initialize();
  
  final prayerService = PrayerService(settingsService);
  await prayerService.initialize();
  
  final audioDeviceService = AudioDeviceService(settingsService);
  await audioDeviceService.initialize();
  
  final scheduleService = ScheduleService(
    settingsService: settingsService,
    prayerService: prayerService,
    audioDeviceService: audioDeviceService,
  );
  await scheduleService.initialize();
  
  final quranService = QuranService();
  await quranService.initialize();
  
  final azkarService = AzkarService();
  
  final mosqueService = MosqueService();
  
  runApp(MyApp(
    settingsService: settingsService,
    prayerService: prayerService,
    audioDeviceService: audioDeviceService,
    scheduleService: scheduleService,
    quranService: quranService,
    azkarService: azkarService,
    mosqueService: mosqueService,
  ));
}

class MyApp extends StatelessWidget {
  final SettingsService settingsService;
  final PrayerService prayerService;
  final AudioDeviceService audioDeviceService;
  final ScheduleService scheduleService;
  final QuranService quranService;
  final AzkarService azkarService;
  final MosqueService mosqueService;
  
  const MyApp({
    Key? key,
    required this.settingsService,
    required this.prayerService,
    required this.audioDeviceService,
    required this.scheduleService,
    required this.quranService,
    required this.azkarService,
    required this.mosqueService,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: settingsService),
        ChangeNotifierProvider.value(value: prayerService),
        ChangeNotifierProvider.value(value: audioDeviceService),
        ChangeNotifierProvider.value(value: scheduleService),
        ChangeNotifierProvider.value(value: quranService),
        Provider.value(value: azkarService),
        Provider.value(value: mosqueService),
      ],
      child: MaterialApp(
        title: 'Bilal The Muezzin',
        theme: AppTheme.lightTheme,
        home: const MainNavigationScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
