import 'package:http/http.dart';
import 'dart:convert';

class Jokes {
  String type;
  String setup;
  String punchline;
  int id;

  Jokes({ required this.type, required this.setup, required this.punchline, required this.id});

  factory Jokes.fromJson(Map<String, dynamic> json) {
    return Jokes(
      type: json['type'],
      setup: json['setup'],
      punchline: json['punchline'],
      id: json['id'],
    );
  }

  Future<void> getJokes() async {
    try {
      Response response = await get(
          Uri.parse(
              'https://official-joke-api.appspot.com/jokes/ten'));
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
         List<Jokes> jokes = jsonData.map((json) => Jokes.fromJson(json)).toList();

        for(Jokes joke in jokes ) {
          print("setup: ${joke.setup}");
          print("punchline: ${joke.punchline}");
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print("there was an error $e");
    }
  }
}