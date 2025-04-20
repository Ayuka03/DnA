//
import 'package:dna_app/presentation/ui/custom_text_field.dart';
import 'package:dna_app/presentation/ui/screens/chat_list_screen.dart';
import 'package:dna_app/presentation/ui/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 150,
              bottom: 220,
              left: 20,
              right: 20,
            ),

            child: Container(
              alignment: Alignment.center,

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(60),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  spacing: 20,
                  children: [
                    Text(
                      'Войдите в DnA!',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    Image.asset(
                      'assets/pictures/logo.png',
                      height: 100,
                      width: 100,
                    ),
                    Text(
                      'Если уже были у нас',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    CustomTextField(labelName: 'Ваша почта'),
                    CustomTextField(labelName: 'Ваш пароль'),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ChatListScreen(),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        foregroundColor: WidgetStatePropertyAll<Color>(
                          const Color.fromARGB(255, 191, 34, 23),
                        ),
                      ),
                      child: Text('Войти'),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: WidgetStatePropertyAll<Color>(
                          const Color.fromARGB(100, 191, 34, 23),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => RegistrationScreen(),
                          ),
                        );
                      },
                      child: Text('Меня здесь не было'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
