import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/services.dart';
import '../utils/app_styles.dart';

class HijriDateDisplay extends StatelessWidget {
  const HijriDateDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prayerService = Provider.of<PrayerService>(context);
    
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Today: ${DateTime.now().toString().substring(0, 10)}',
            style: AppStyles.captionStyle,
          ),
          Text(
            'Hijri: ${prayerService.hijriDate ?? 'Loading...'}',
            style: AppStyles.captionStyle.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
