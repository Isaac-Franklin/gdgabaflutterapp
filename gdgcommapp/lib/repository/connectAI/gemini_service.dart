import 'dart:convert';
import 'package:gdgcommapp/repository/model/eventsmodel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiKey = 'YOUR_API_KEY_HERE';
  final String baseUrl = 'https://api.gemini.ai/v1';

  Future<List<TechEventsModel>> getTechEvents(String city) async {
    final response = await http.get(
      Uri.parse('$baseUrl/events?city=$city&year=${DateTime.now().year}'),
      headers: {
        'Authorization': 'Bearer $apiKey',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['events'];
      return data.map((json) => TechEventsModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load events');
    }
  }
}
