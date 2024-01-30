import 'package:flutter/material.dart';
import 'detail_view.dart';
import 'package:flutter_example/services/api_service.dart';
import 'package:flutter_example/services/api_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late String type;
  late String setup;
  late String punchline;
  late int id;
  late List<Jokes> jokeList;

  @override
  void initState() {
    super.initState();

    final Map<String, dynamic> arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    setState(() {
      type = arguments['type'];
      setup = arguments['setup'];
      punchline = arguments['punchline'];
      id = arguments['id'];
      jokeList = List<Jokes>.from(arguments['jokeList'].map((json) => Jokes.fromJson(json)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: ListView.builder(
            itemCount: jokeList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
                child: Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailView(
                            index: index,
                            punchline: jokeList[index].punchline,
                          ),
                        ),
                      );
                    },
                    title: Text('${jokeList[index].setup}'),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
