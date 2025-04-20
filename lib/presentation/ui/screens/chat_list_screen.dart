import 'package:dna_app/presentation/ui/screens/personal_chat.dart';
import 'package:dna_app/presentation/ui/screens/settings_srceen.dart';
import 'package:flutter/material.dart';

class ChatListScreen extends StatefulWidget {
  ChatListScreen({super.key, required this.user});
  final String user;

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  List<dynamic> chts = [];
  int selectedIndex = 0;

  String userName = 'Даниил Бедарев'; //Временно!!!!
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.edit_square),
            color: Colors.white,
          ),
        ],
        centerTitle: true,
        title: Text('Мессенджер'),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 23,
          fontWeight: FontWeight.w500,
        ),
        leading: Container(
          padding: EdgeInsets.all(6),
          child: GestureDetector(
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://avatars.mds.yandex.net/i?id=a374adb6500819717978c38b4b4a0799_l-4284908-images-thumbs&ref=rim&n=13&w=914&h=779',
              ),
            ),
            onTap: () {},
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          print(index);
          if (selectedIndex == index) return;
          if (index == 1) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder:
                    (context) =>
                        SettingsSrceen(user: 'user', indexBottomBar: 1),
              ),
            );
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Чаты'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Настройки',
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 250, 63, 40),
      body: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Flexible(
                child: ListView.separated(
                  separatorBuilder:
                      (context, index) => Divider(
                        thickness: 2,
                        height: 1,
                        color: Color.fromARGB(40, 250, 63, 40),
                      ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 3,
                        horizontal: 10,
                      ),
                      visualDensity: VisualDensity(vertical: -0.2),
                      leading: ClipOval(
                        child: Image.network(
                          'https://sportishka.com/uploads/posts/2022-11/1667451727_6-sportishka-com-p-kachok-bez-golovi-vkontakte-7.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      trailing: Icon(
                        Icons.new_releases_outlined,
                        color: Colors.red,
                      ),
                      title: Text('Даниил Бедарев'),
                      subtitle: Text('Привет, какашка!'),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder:
                                (context) => PersonalChat(userName: userName),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
     // index = 0;

              // setState(() {
              //   selectedIndex = index;
              // });

              // if (index == 0) {
              //   Navigator.of(context).push(
              //     MaterialPageRoute(
              //       builder: (context) => PersonalChat(userName: userName),
              //     ),
              //   );
              // } else {
              //   Navigator.of(context).push(
              //     MaterialPageRoute(
              //       builder: (context) => SettingsSrceen(user: user),
              //     ),
              //   );
              // }