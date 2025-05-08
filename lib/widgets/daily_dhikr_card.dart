import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/services.dart';
import '../models/models.dart';
import '../utils/app_styles.dart';
import '../utils/app_theme.dart';

class DailyDhikrCard extends StatefulWidget {
  const DailyDhikrCard({Key? key}) : super(key: key);

  @override
  State<DailyDhikrCard> createState() => _DailyDhikrCardState();
}

class _DailyDhikrCardState extends State<DailyDhikrCard> {
  late DhikrEntry _dhikr;
  
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final dhikrService = Provider.of<DhikrService>(context, listen: false);
    _dhikr = dhikrService.getRandomDhikr();
  }
  
  @override
  Widget build(BuildContext context) {
    final dhikrService = Provider.of<DhikrService>(context, listen: false);
    
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
                  'Daily Dhikr',
                  style: AppStyles.subheadingStyle,
                ),
                IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () {
                    setState(() {
                      _dhikr = dhikrService.getRandomDhikr();
                    });
                  },
                ),
              ],
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                _dhikr.arabic,
                style: AppStyles.arabicStyle.copyWith(
                  fontSize: 24.0,
                  color: AppColors.primary,
                ),
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              _dhikr.transliteration,
              style: AppStyles.bodyStyle.copyWith(
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              _dhikr.translation,
              style: AppStyles.bodyStyle,
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Source: ${_dhikr.source}',
                  style: AppStyles.captionStyle,
                ),
                Chip(
                  label: Text('Repeat ${_dhikr.count}x'),
                  backgroundColor: AppColors.accent.withOpacity(0.2),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
