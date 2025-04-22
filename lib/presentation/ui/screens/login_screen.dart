//
import 'package:dna_app/presentation/ui/custom_text_field.dart';
import 'package:dna_app/presentation/ui/screens/chat_list_screen.dart';
import 'package:dna_app/presentation/ui/screens/registration_screen.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                      style: Theme.of(context).textTheme.titleLarge,
                    ),

                    Image.asset(
                      'assets/pictures/logo.png',
                      height: 100,
                      width: 100,
                    ),
                    Text(
                      'Если уже были у нас',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    CustomTextField(
                      labelName: 'Ваша почта',
                      controller: _emailController,
                    ),
                    CustomTextField(
                      labelName: 'Ваш пароль',
                      controller: _passwordController,
                    ),
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
                      child: Text(
                        'Войти',
                        // style: GoogleFonts.openSans(),
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => RegistrationScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Меня здесь не было',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
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
