import 'package:currency_converter/screens/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Open Exchange App',
        theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 252, 182, 206),
        ),
        debugShowCheckedModeBanner: false,
        home: Home());
  }
}
