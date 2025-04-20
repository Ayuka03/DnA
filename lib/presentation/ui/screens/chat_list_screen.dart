import 'package:flutter/material.dart';

class ChatListScreen extends StatelessWidget {
  ChatListScreen({super.key});
  List<dynamic> chts = [];

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
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 23,
          fontWeight: FontWeight.w500,
        ),
        leading: GestureDetector(
          child: Container(
            height: 5,
            width: 5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                  'https://avatars.mds.yandex.net/i?id=c70d5bd654c8ad9b7041453b3226875e_l-12421557-images-thumbs&n=13',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 250, 63, 40),
      body: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
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
                          'https://i.pinimg.com/originals/55/64/7d/55647dc681ad4abfe0ba40ba31d4a180.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text('просто данёк'),
                      subtitle: Text('Печатает ...'),
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
