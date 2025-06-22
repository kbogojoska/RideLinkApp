import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

class GeocodingHelper {
  static Future<LatLng?> getCoordinates(String place) async {
    final url = Uri.parse(
        'https://nominatim.openstreetmap.org/search?q=$place&format=json&limit=1');

    final response = await http.get(url, headers: {
      'User-Agent': 'Flutter App',
    });

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      if (data.isNotEmpty) {
        final lat = double.parse(data[0]['lat']);
        final lon = double.parse(data[0]['lon']);
        return LatLng(lat, lon);
      }
    }
    return null;
  }
}