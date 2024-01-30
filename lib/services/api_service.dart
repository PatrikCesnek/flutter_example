import 'package:http/http.dart';
import 'dart:convert';

class Jokes {
  final String type;
  final String setup;
  final String punchline;
  final int id;
  List<Jokes> jokesList = [];

  Jokes({
    required this.type,
    required this.setup,
    required this.punchline,
    required this.id,
  });

  factory Jokes.fromJson(Map<String, dynamic> json) {
    return Jokes(
      type: json['type'] ?? '',
      setup: json['setup'] ?? '',
      punchline: json['punchline'] ?? '',
      id: json['id'] ?? 0,
    );
  }

  static Future<List<Jokes>> fetchJokes() async {
    try {
      Response response = await get(
        Uri.parse('https://official-joke-api.appspot.com/jokes/ten'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        List<Jokes> jokesList = jsonData.map((json) => Jokes.fromJson(json)).toList();
        return jokesList;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print("There was an error $e");
      throw e;
    }
  }
}