import 'package:flutter/material.dart';
import 'package:flutter_example/pages/home.dart';

void main() => runApp(MaterialApp(
  initialRoute: "/home",
  routes: {
    "/home": (context) => Home(),
  },
));
