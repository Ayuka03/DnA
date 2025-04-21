import 'package:dna_app/presentation/ui/screens/chat_list_screen.dart';
import 'package:flutter/material.dart';

class SettingsSrceen extends StatefulWidget {
  const SettingsSrceen({
    super.key,
    required this.user,
    required this.indexBottomBar,
  });
  final String user;
  final int indexBottomBar;

  @override
  State<SettingsSrceen> createState() => _SettingsSrceenState();
}

class _SettingsSrceenState extends State<SettingsSrceen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: widget.indexBottomBar,
      //   onTap: (index) {
      //     print(index);
      //     if (widget.indexBottomBar == index) return;
      //     if (index == 0) {
      //       Navigator.pop(context);
      //     }
      //   },
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Чаты'),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.settings),
      //       label: 'Настройки',
      //     ),
      //   ],
      // ),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Настройки'),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 23,
          fontWeight: FontWeight.w500,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
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
            currentIndex: widget.indexBottomBar,
            onTap: (index) {
              print(index);
              if (widget.indexBottomBar == index) return;
              if (index == 0) {
                Navigator.pop(context);
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
