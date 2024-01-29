import 'package:flutter/material.dart';
import 'detail_view.dart'; // Import the DetailView class


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
              child: Card(
                child: ListTile(
                  onTap: () {
                    print(index);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailView(
                            index: index,
                            punchline: "Temporary punchline",
                        ),
                      ),
                    );
                  },
                  title: Text("Temporary setup of: $index"),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
