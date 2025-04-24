// import 'package:dna_app/presentation/ui/screens/chat_list_screen.dart';
import 'package:dna_app/presentation/ui/screens/sign_in_feature/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart' hide LinearGradient;

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
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
            height: 320,
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
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    height: 170,
                    width: 170,
                    child: RiveAnimation.asset(
                      speedMultiplier: 0.6,
                      'assets/animations/animated_logo.riv',
                    ),
                  ),
                  // Image.asset(
                  //   'assets/pictures/logo.png',
                  //   height: 170,
                  //   width: 170,
                  // ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text(
                      'Связать',
                      style: Theme.of(context).textTheme.labelMedium,
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
