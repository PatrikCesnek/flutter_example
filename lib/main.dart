import 'package:flutter/material.dart';
import 'package:flutter_example/pages/home.dart';
import 'package:flutter_example/pages//loading.dart';

void main() => runApp(MaterialApp(
  initialRoute: "/",
  routes: {
    '/' : (context) => Loading(),
    "/home": (context) => Home(),
  },
));
