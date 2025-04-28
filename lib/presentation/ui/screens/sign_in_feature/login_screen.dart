import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dna_app/presentation/ui/screens/custom_widgets/custom_text_field.dart';
import 'package:dna_app/presentation/ui/screens/chat_feature/home_screen.dart';
import 'package:dna_app/presentation/ui/screens/sign_in_feature/registration_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool userInvalid = false;

  String userEmail = '';
  String userName = '';

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                      onPressed: () async {
                        await signInUser(
                          _emailController.text.trim(),
                          _passwordController.text.trim(),
                        );
                        if (userInvalid) {
                          _passwordController.clear();
                        }
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

  Future<void> signInUser(String email, String password) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Такого пользователя не существует')),
        );
        return;
      }
      if (userCredential.user?.email == null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Введите почту!')));
        return;
      }
      userEmail = userCredential.user?.email ?? '';
      await dataGet();
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => HomeScreen(userName: userName)),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Возникла ошибка')));
      userInvalid = true;
    }
  }

  Future<void> dataGet() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    print(userId);
    final data =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    print(data.data());
    userName = data.data()?['name'].toString() ?? 'DnA';
  }
}
