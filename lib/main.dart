import 'package:dna_flutter_app/presentation/ui/screens/start_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 250, 63, 40),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 250, 63, 40),
        ),
      ),
      home: const StartScreen(),
    );
  }
}
