import 'package:flutter/material.dart';

class DetailView extends StatelessWidget {
  final int index;
  final String punchline;

  DetailView({required this.index, required this.punchline});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Punchline View'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Punchline: $punchline'),
            ],
          ),
        ),
      ),
    );
  }
}