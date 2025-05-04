//
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dna_app/presentation/ui/screens/custom_widgets/custom_text_field.dart';
import 'package:dna_app/presentation/ui/screens/chat_feature/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _passwordAgainController =
      TextEditingController();
  bool successRegistration = false;
  String userName = '';
  int indImage = 0;
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordAgainController.dispose();
    super.dispose();
  }

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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 80,
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
                      style: Theme.of(context).textTheme.titleLarge,
                    ),

                    Image.asset(
                      'assets/pictures/logo.png',
                      height: 100,
                      width: 100,
                    ),
                    Text(
                      'Если не были у нас',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    CustomTextField(
                      labelName: 'Ваше имя',
                      controller: _nameController,
                    ),
                    CustomTextField(
                      labelName: 'Ваша почта',
                      controller: _emailController,
                    ),
                    CustomTextField(
                      labelName: 'Ваш пароль',
                      controller: _passwordController,
                    ),
                    CustomTextField(
                      labelName: 'Ваш пароль снова',
                      controller: _passwordAgainController,
                    ),
                    TextButton(
                      onPressed: () {
                        register(
                          _nameController.text.trim(),
                          _emailController.text.trim(),
                          _passwordController.text.trim(),
                          _passwordAgainController.text.trim(),
                        );
                        if (successRegistration) {
                          _emailController.clear();
                          _passwordController.clear();
                          _passwordAgainController.clear();
                          successRegistration = false;
                        }

                        print(successRegistration);
                      },

                      child: Text(
                        'Зарегистрироваться',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
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
                      child: Text(
                        'Я здесь был',
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

  Future<void> register(
    String name,
    String email,
    String password,
    String passwordAgain,
  ) async {
    final List<String> friends = [];
    final bool emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email);
    if (!emailValid) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Неправильно введена почта!')));
      return;
    }
    if (name == '') {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Имя не должно быть пустым!')));
      return;
    }
    if (password.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Пароль должен содержать больше 6 символов!')),
      );
      return;
    }
    if (password != passwordAgain) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Пароли не совпадают!')));
      return;
    } else {
      try {
        final userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        final random = Random();

        final uid = userCredential.user?.uid;
        FirebaseFirestore.instance.collection('users').doc(uid).set({
          'email': email,
          'name': name,
          'indexImage': random.nextInt(6),
          'friends': friends,
        });
        successRegistration = true;
        await dataGet();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder:
                (BuildContext context) =>
                    HomeScreen(userName: userName, indImage: indImage),
          ),
        );
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text('Вы успешно зарегистрировались')),
        // );
        return;
      } catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Возникла ошибка...')));
      }

      debugPrint('Пользователь создан');
    }
  }

  Future<void> dataGet() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    final data =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    userName = data.data()?['name'].toString() ?? 'DnA';
    indImage = data.data()?['indexImage'] ?? 0;
  }
}
