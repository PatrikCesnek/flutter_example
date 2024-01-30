import 'package:flutter/material.dart';
import 'detail_view.dart';
import 'package:flutter_example/services/api_service.dart';
import 'package:flutter_example/models/jokes.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Jokes> jokeList;
  bool isLoading = true; // Add a loading state

  @override
  void initState() {
    super.initState();
    fetchJokes();
  }

  Future<void> fetchJokes() async {
    try {
      List<Jokes> jokes = await ApiService.getJokes();

      setState(() {
        jokeList = jokes;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(), // Show a loading indicator
        ),
      );
    } else {
      try {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Choose a setup"),
          ),
          backgroundColor: Colors.grey[200],
          body: ListView.builder(
            itemCount: jokeList.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailView(
                              index: index,
                              punchline: jokeList[index].punchline,
                            ),
                      ),
                    );
                  },
                  title: Text('${jokeList[index].setup}'),
                ),
              );
            },
          ),
        );
      } catch (e, stackTrace) {
        print('Error during build: $e\n$stackTrace');
        return Scaffold(
          backgroundColor: Colors.grey[200],
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: 100),
                  Text("There was an error: $e"),
                  ElevatedButton(
                    onPressed: () {
                      isLoading = true;
                      fetchJokes();
                      print(isLoading);
                    },
                    child: Text("Try again"),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    }
  }
}