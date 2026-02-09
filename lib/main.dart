import 'package:flutter/material.dart';
import 'package:muslim_counter_app/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 3, 13, 7),
        colorScheme:
            ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(
                255,
                3,
                13,
                7,
              ), // Your dark green base
            ).copyWith(
              primary: Colors.green.shade900,
              onPrimary: Colors.white,
              secondary: Colors.amber, // Gold accent for a premium feel?
              surface: Colors.grey.shade100,
            ),
      ),
      home: const MyHomePage(),
    );
  }
}
