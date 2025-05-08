import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/services.dart';
import '../models/models.dart';
import '../utils/app_styles.dart';
import '../utils/app_theme.dart';

class AzkarScreen extends StatefulWidget {
  const AzkarScreen({Key? key}) : super(key: key);

  @override
  State<AzkarScreen> createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }
  
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    final azkarService = Provider.of<AzkarService>(context, listen: false);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Azkar'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Morning'),
            Tab(text: 'Evening'),
            Tab(text: 'Daily'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildAzkarList(context, azkarService.getMorningAzkar()),
          _buildAzkarList(context, azkarService.getEveningAzkar()),
          _buildAzkarList(context, azkarService.getDailyAzkar()),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Navigate to azkar schedule screen
        },
        icon: const Icon(Icons.schedule),
        label: const Text('Schedule Azkar'),
      ),
    );
  }
  
  Widget _buildAzkarList(BuildContext context, List<DhikrEntry> azkar) {
    return ListView.builder(
      itemCount: azkar.length,
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, index) {
        final dhikr = azkar[index];
        return Card(
          elevation: 2.0,
          margin: const EdgeInsets.only(bottom: 16.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dhikr.arabic,
                  style: AppStyles.arabicStyle.copyWith(
                    fontSize: 24.0,
                    color: AppColors.primary,
                  ),
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(height: 16.0),
                Text(
                  dhikr.transliteration,
                  style: AppStyles.bodyStyle.copyWith(
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  dhikr.translation,
                  style: AppStyles.bodyStyle,
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Source: ${dhikr.source}',
                      style: AppStyles.captionStyle,
                    ),
                    Chip(
                      label: Text('Repeat ${dhikr.count}x'),
                      backgroundColor: AppColors.accent.withOpacity(0.2),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Benefit: ${dhikr.benefit}',
                  style: AppStyles.captionStyle.copyWith(
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      icon: const Icon(Icons.play_arrow),
                      label: const Text('Play Audio'),
                      onPressed: () {
                        // Play audio
                      },
                    ),
                    OutlinedButton.icon(
                      icon: const Icon(Icons.share),
                      label: const Text('Share'),
                      onPressed: () {
                        // Share dhikr
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
