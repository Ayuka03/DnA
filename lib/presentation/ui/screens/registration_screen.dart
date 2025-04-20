//
import 'package:dna_app/presentation/ui/custom_text_field.dart';
import 'package:dna_app/presentation/ui/screens/chat_list_screen.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 63, 40),
      body: SingleChildScrollView(
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
                    'Регистрация в DnA!',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    'Если не были у нас',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  CustomTextField(labelName: 'Ваша почта'),
                  CustomTextField(labelName: 'Ваш пароль'),
                  CustomTextField(labelName: 'Ваш пароль снова'),
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      foregroundColor: WidgetStatePropertyAll<Color>(
                        const Color.fromARGB(255, 191, 34, 23),
                      ),
                    ),
                    child: Text('Зарегистрироваться'),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: WidgetStatePropertyAll<Color>(
                        const Color.fromARGB(100, 191, 34, 23),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Я здесь был'),
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
