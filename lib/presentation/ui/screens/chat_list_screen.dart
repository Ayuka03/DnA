import 'package:dna_app/presentation/ui/screens/personal_chat.dart';
import 'package:flutter/material.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  String userName = 'Даниил Бедарев'; //Временно!!!!
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
            color: Colors.white,
          ),
        ],
        centerTitle: true,
        title: Text('Мессенджер'),

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
                    final String imageUrl =
                        'https://memepedia.ru/wp-content/uploads/2016/09/uzbagoysya_29873845_orig_.jpeg';
                    return ListTile(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 3,
                        horizontal: 10,
                      ),
                      visualDensity: VisualDensity(vertical: -0.2),

                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(imageUrl),
                      ),
                      trailing: Stack(
                        alignment: Alignment.center,
                        children: [
                          Icon(Icons.circle_rounded, color: Colors.red),
                          // СЮДА ВМЕСТО ИКОНКИ НАДО МАЛЕНЬКУЮ МОЛЕКУЛЬКУ
                          //
                          //
                          //
                          Text('1', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      title: Text(
                        'Даниил Бедарев',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      subtitle: Text(
                        'Привет, какашка!',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder:
                                (context) => PersonalChat(
                                  userName: userName,
                                  imageUrl: imageUrl,
                                ),
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
