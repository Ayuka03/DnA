import 'package:dna_app/presentation/ui/screens/chat_list_screen.dart';
import 'package:dna_app/presentation/ui/screens/settings_srceen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.userEmail});
  final String userEmail;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: [
          ChatListScreen(userEmail: widget.userEmail),
          SettingsSrceen(user: widget.userEmail),
        ],
      ),

      bottomNavigationBar: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 220, 220, 220),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(100, 0, 0, 0),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Color.fromARGB(255, 250, 63, 40),
            unselectedItemColor: Colors.black45,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
            currentIndex: selectedIndex,
            onTap: (index) {
              if (selectedIndex == index) {
                return;
              } else {
                setState(() {
                  selectedIndex = index;
                });
              }
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Чаты'),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Настройки',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
