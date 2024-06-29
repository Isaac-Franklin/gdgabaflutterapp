import 'dart:convert';

Future<Map<String, dynamic>> getTechEvents(String city) async {
  final url = Uri.https('api.example.com', '/events', {'city': city});
  var http;
  final response = await http.get(url);

  if (response.statusCode != 200) {
    throw Exception('Failed to load events: ${response.statusCode}');
  }

  // Assuming JSON response, parse it if needed
  final parsedJson = jsonDecode(response.body);
  return parsedJson;
}
