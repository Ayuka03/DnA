// import 'package:dna_app/presentation/ui/screens/chat_list_screen.dart';
import 'package:dna_app/presentation/ui/screens/login_screen.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 63, 40),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 250, 63, 40),
              const Color.fromARGB(255, 248, 183, 183),
            ],
          ),
        ),
        child: Center(
          child: Container(
            alignment: Alignment.center,
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(60),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                // spacing: 10,
                children: [
                  Text(
                    'Добро пожаловать!',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                  ),

                  Image.asset(
                    'assets/pictures/logo.png',
                    height: 170,
                    width: 170,
                  ),

                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text(
                      'Связать',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 191, 34, 23),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
