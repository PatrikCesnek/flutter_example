import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_example/models/jokes.dart';

class ApiService {
  static const String apiEndpoint = 'https://official-joke-api.appspot.com/jokes/ten';

  static Future<List<Jokes>> getJokes() async {
    try {
      final response = await http.get(Uri.parse(apiEndpoint));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        List<Jokes> jokes = jsonData.map((json) => Jokes.fromJson(json)).toList();
        return jokes;
      } else {
        throw Exception('Failed to load jokes');
      }
    } catch (e) {
      print("Error in ApiService: $e");
      throw e;
    }
  }
}
