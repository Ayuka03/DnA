// import 'package:dna_app/presentation/ui/screens/chat_list_screen.dart';
import 'package:dna_app/presentation/ui/screens/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          titleLarge: GoogleFonts.openSans(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          titleMedium: GoogleFonts.openSans(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
          titleSmall: GoogleFonts.openSans(
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),

          labelSmall: GoogleFonts.openSans(
            color: const Color.fromARGB(100, 191, 34, 23),
            // (color: const Color.fromARGB(179, 195, 54, 44)),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          labelMedium: GoogleFonts.openSans(
            color: const Color.fromARGB(255, 191, 34, 23),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),

          headlineMedium: GoogleFonts.openSans(
            // color: const Color.fromARGB(100, 191, 34, 23),
            color: const Color.fromARGB(179, 195, 54, 44),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),

        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 250, 63, 40),
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: GoogleFonts.openSans(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          backgroundColor: Color.fromARGB(255, 250, 63, 40),
        ),
      ),
      home: StartScreen(),
    );
  }
}
