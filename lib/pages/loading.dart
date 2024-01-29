import 'package:flutter/material.dart';
import 'package:flutter_example/services/api_service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setUpJokes() async {
    Jokes instance = Jokes(
        type: "general",
        setup: "How does a dyslexic poet write?",
        punchline: "Inverse",
        id: 133
    );
    await instance.getJokes();

    Navigator.pushReplacementNamed(context, "/home", arguments: {
      'type': instance.type,
      'setup': instance.setup,
      'punchline': instance.punchline,
      'id': instance.id,
      'jokeList': instance.jokeList
    });
  }

  @override
  void initState() {
    super.initState();
    setUpJokes();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: SpinKitFadingCircle(
            size: 50,
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: index.isEven ? Colors.blueGrey : Colors.blue,
                ),
              );
            },
          ),
        )
    );
  }
}
