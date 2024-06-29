// import 'dart:convert';
// import 'package:gdgcommapp/repository/model/eventsmodel.dart';
// import 'package:http/http.dart' as http;
import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService {
  Future getTechEvents(String city) async {
    const apiKey = 'AIzaSyCkIwgMVXnmY6WgJrK_bxmaDOK3ev-OG3c';
    final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey);
    final content = [
      Content.text('List of tech events in $city for ${DateTime.now().year}')
    ];
    final response = await model.generateContent(content);
    final finalResponse = response.text;
    print(finalResponse);

    // if (response.error != null) {
    //   throw Exception('Failed to load events: ${response.error}');
    // }
    if (response.text == null) {
      throw Exception('An error occured');
    } else {
      return finalResponse;
    }
    // Parse the content string to JSON
    // final parsedJson = jsonDecode(response.content);
    // return parsedJson;
    // final events = response.text;
    // print(events); // Do something with the events
  }
}

//     if (response.statusCode == 200) {
//       // return jsonDecode(response.body);
//       final List<dynamic> data = jsonDecode(response.body)['events'];
//       return data.map((json) => TechEventsModel.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to connect to Gemini AI/events');
//     }
//   }
// }
