import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String baseUrl = 'https://smoggy-cow-shift.cyclic.app/api';

  static Future<List<String>> getStations(String trainNo) async {
    String? _token;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _token = prefs.getString('token');

    final now = DateTime.now();
    final time = '${now.hour.toString().padLeft(2, '0')}.${now.minute.toString().padLeft(2, '0')}';
    final url = '$baseUrl/stations?trainNo=$trainNo&time=$time';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $_token'
    };
    final response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data
          .map((station) => station['source_stn_name'] as String)
          .toList();
    } else {
      throw Exception('Failed to load stations');
    }
  }

  static Future<List<String>> getRestaurants(String stationName) async {
    final encodedName = Uri.encodeQueryComponent(stationName);
    final url = '$baseUrl/station?name=$encodedName';
    final headers = {
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImphbmVzbWl0aCIsImlkIjoiNjQ0YTQzZmFlYjNiNGRkZDlhZDYyMzM0IiwiaWF0IjoxNjgyNjA1NTA3fQ.wRAOilGMvxOnsvLB_sZRHiOASuZWyRLv4MK8x7FMPqg'
    };
    final response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data
          .map((restaurant) => restaurant['name'] as String)
          .toList();
    } else {
      throw Exception('Failed to load restaurants');
    }
  }
}
