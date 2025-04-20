import 'package:dna_app/presentation/ui/screens/login_screen.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 63, 40),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(60),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  'Добро пожаловать!',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Text(
                    textAlign: TextAlign.center,
                    'Спасибо за использование нашего проекта, ...+logo',
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Text('нажми нажми'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
