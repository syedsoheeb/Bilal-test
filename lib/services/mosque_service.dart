import '../models/models.dart';

class MosqueService {
  Future<List<Mosque>> getNearbyMosques(double latitude, double longitude, {double radius = 5.0}) async {
    // In a real app, this would query an API to find nearby mosques
    // For now, we'll return a list of sample mosques
    return [
      Mosque(
        name: 'Masjid Al-Haram',
        address: 'Makkah, Saudi Arabia',
        distance: 0.5,
        latitude: 21.4225,
        longitude: 39.8262,
        website: 'https://www.gph.gov.sa',
        phone: '+966 12 526 7777',
      ),
      Mosque(
        name: 'Masjid Al-Nabawi',
        address: 'Medina, Saudi Arabia',
        distance: 4.2,
        latitude: 24.4672,
        longitude: 39.6111,
        website: 'https://www.gph.gov.sa',
        phone: '+966 14 826 1804',
      ),
    ];
  }
}
